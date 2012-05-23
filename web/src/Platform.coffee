NT = window.NT || {}
window.NT = NT

class NT.Platform
  constructor: (@widthByTiles, @tileBitmap, @x = 0, @y = 20) ->
   @width = null
   @tiles = new Container()
   @tiles.x = @x
   @tiles.y = @y
   @tileBitmap.regX = 0;
   @tileBitmap.regY = 0;
   for i in [0...@widthByTiles]
    clonedTile = tileBitmap.clone()
    clonedTile.x = i * tileBitmap.width
    clonedTile.y = 0

    @tiles.addChild clonedTile

  getDisplayObject: () ->
    return @tiles
    
  move: ( x = -1, y = 0 ) ->
    @tiles.x += x
    @tiles.y += y
    
  isVisibleInCanvas: ( canvas ) ->
    @tiles.x + @getWidth() >= 0 and @tiles.x <= canvas.width
  
  getWidth: () ->
    return @width unless @width == null
    @width = @tileBitmap.width * @widthByTiles