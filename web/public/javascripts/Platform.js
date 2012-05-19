(function() {
  var NT;

  NT = window.NT || {};

  window.NT = NT;

  NT.Platform = (function() {

    function Platform(widthByTiles, tileBitmap, x, y) {
      var clonedTile, i, _ref;
      this.widthByTiles = widthByTiles;
      this.tileBitmap = tileBitmap;
      this.x = x != null ? x : 0;
      this.y = y != null ? y : 20;
      this.tiles = new Container();
      this.tiles.x = this.x;
      this.tiles.y = this.y;
      this.tileBitmap.regX = 0;
      this.tileBitmap.regY = 0;
      for (i = 0, _ref = this.widthByTiles; 0 <= _ref ? i < _ref : i > _ref; 0 <= _ref ? i++ : i--) {
        clonedTile = tileBitmap.clone();
        clonedTile.x = i * tileBitmap.width;
        clonedTile.y = 0;
        this.tiles.addChild(clonedTile);
      }
    }

    Platform.prototype.getDisplayObject = function() {
      return this.tiles;
    };

    return Platform;

  })();

}).call(this);
