class RoRChallenge.Routers.PeopleRouter extends Backbone.Router
  initialize: (options) ->
    @people = new RoRChallenge.Collections.PeopleCollection()
    @people.reset options.people

  routes:
    "index"    : "index"
    ":id/edit" : "edit"
    
    ".*"        : "index"

  index: ->
    @view = new RoRChallenge.Views.People.IndexView(collection: @people)
    $("#people").html(@view.render().el)

  edit: (id) ->
    person = @people.get(id)

    @view = new RoRChallenge.Views.People.EditView(model: person)
    $("#people").html(@view.render().el)
