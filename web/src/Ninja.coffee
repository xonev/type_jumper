NT = window.NT || {}
window.NT = NT

class NT.Ninja
  constructor: (@displayObj, @x, @y) ->
    @displayObj.x = @x
    @displayObj.y = @y

  getDisplayObject: ->
    @displayObj