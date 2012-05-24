NT = window.NT || {}
window.NT = NT

class NT.Word

  WIDTH_PER_LETTER = 12
  WORD_HEIGHT = 30
  MIN_WIDTH = 30
  TEXT_COLOR = "#000"

  constructor: (@word, x = 0, y = 0) ->
    throw "missing word parameter" if @word is null
    @container = new Container()
    width = @word.length * WIDTH_PER_LETTER
    if width < MIN_WIDTH then width = MIN_WIDTH #set min width
    graphics = new Graphics()
    graphics.beginLinearGradientFill(["#58b", "#8be"], [0,1], 0, 0, 0, WORD_HEIGHT)
      .beginStroke(Graphics.getRGB(0,0,0))
      .drawRect(0, 0, width, WORD_HEIGHT)

    shape = new Shape graphics
    shape.x = x - ( width / 2 ) #center that block
    shape.y = y

    text = new Text @word, "26px bold Arial", TEXT_COLOR
    text.x = shape.x + ( width / 2 )
    text.y = shape.y + ( WORD_HEIGHT / 2 ) + 7
    text.lineHeight = WORD_HEIGHT
    text.maxWidth = width
    text.textAlign = "center"

    @container.addChild shape
    @container.addChild text

  getDisplayObject: () ->
    @container