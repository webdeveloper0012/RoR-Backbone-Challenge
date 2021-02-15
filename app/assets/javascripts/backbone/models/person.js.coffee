class RoRChallenge.Models.Person extends Backbone.Model
  paramRoot: 'person'

  defaults:
    first_name: null
    last_name: null
    email: null
    phone: null

class RoRChallenge.Collections.PeopleCollection extends Backbone.Collection
  model: RoRChallenge.Models.Person
  url: '/people'
