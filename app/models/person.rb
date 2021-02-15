require 'csv'
require 'activerecord-import/base'
require 'activerecord-import/active_record/adapters/sqlite3_adapter'

class Person < ApplicationRecord
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  class << self
    def my_import(file)
      people = []
      CSV.foreach(file.path, headers: true) do |row|
        person = Person.new(row.to_h)
        unless person.valid?
          person.save_errors = nil
          error = person.errors.full_messages.join(", ")
          person.save_errors = error
        end
        people << person
      end
      Person.import people, recursive: true, validate: false
    end
  end
end
