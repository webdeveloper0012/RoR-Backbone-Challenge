RoRChallenge.Views.People ||= {}

class RoRChallenge.Views.People.EditView extends Backbone.View
  template: JST["backbone/templates/people/edit"]

  events:
    "submit #edit-person": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (person) =>
        @model = person
        window.location.hash = "/"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
