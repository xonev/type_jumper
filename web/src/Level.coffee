NT = window.NT || {}
window.NT = NT

class NT.Level
  #jsonLevel is defined as such [ { word: "a" }, { word: "b" } ]
  constructor: (@canvas, @contentLoader, jsonLevel) ->
    @lastElapsed = 0

    #linear background
    g = new Graphics()
    g.beginLinearGradientFill(["#369", "#036"], [0,1], 0, 0, 0, @canvas.height)
      .drawRect(0, 0, @canvas.width, @canvas.height)
      .draw(@canvas.getContext "2d")
    background = new Shape(g)
    background.cache 0, 0, @canvas.width, @canvas.height
    @stage = new Stage @canvas
    @stage.addChild background

    #add ninja
    ninjaBmp = new Bitmap @contentLoader.imgNinja
    @ninja = new NT.Ninja ninjaBmp, 320, 240
    @stage.addChild @ninja.getDisplayObject()

    @load jsonLevel

    Ticker.addListener this
    # Targeting 60 FPS
    Ticker.setFPS 60

  load: (jsonLevel) ->
    platformTile = new Bitmap @contentLoader.imgTile
    platformTile.width = @contentLoader.imgTile.width
    platformTile.height = @contentLoader.imgTile.height

    @platforms = []
    @words = []
    x = 0
    PLATFORM_GAP_SPACING = 80
    WORD_HEIGHT_DELTA = 150
    for platformDef in jsonLevel
      lastPlatform = new NT.Platform platformDef.word.length, platformTile, x, @canvas.height - 60
      @platforms.push lastPlatform
      word = new NT.Word platformDef.word, x + lastPlatform.getWidth() + ( PLATFORM_GAP_SPACING / 2 ), lastPlatform.tiles.y - WORD_HEIGHT_DELTA
      @words.push word
      x += lastPlatform.getWidth() + PLATFORM_GAP_SPACING

  startLevel: () ->
    for platform in @platforms
      @stage.addChild platform.getDisplayObject()
    for word in @words
      @stage.addChild word.getDisplayObject()

  # moveVelocity is in units of pixels per second
  moveVelocity = -600
  tick: ->
    elapsedSec = Ticker.getTime(false)
    currentElapsed = (elapsedSec - @lastElapsed) / 1000
    @lastElapsed = elapsedSec

#    for platform in @platforms
#      if not platform.isVisibleInCanvas(@canvas) then moveVelocity *= -2
#      if Math.abs(moveVelocity) > 1000 then moveVelocity /= 10 | 0
#      platform.velocity = x: moveVelocity, y: 0
#      platform.update(currentElapsed)
    @stage.update()