NT = window.NT || {}
window.NT = NT

class NT.Platform
  constructor: (@widthByTiles, @tileBitmap, @x = 0, @y = 20) ->
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