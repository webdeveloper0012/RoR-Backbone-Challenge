class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  def import
    Person.my_import(params[:file])
    redirect_to root_url, notice: "Successfully Imported Data!!!"
  end

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1/edit
  def edit
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        @person.update_column(:save_errors, nil)
        format.html { redirect_to @person, notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :email, :phone, :save_errors)
    end
end
