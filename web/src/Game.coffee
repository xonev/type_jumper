NT = window.NT || {}
window.NT = NT

class NT.Game
  constructor: (@canvas, @contentLoader) ->

  loadLevel: (jsonLevelDef) ->
    @level = new NT.Level @canvas, @contentLoader, jsonLevelDef
    @level.startLevel()