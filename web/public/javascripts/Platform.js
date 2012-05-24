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
      this.width = null;
      this.tiles = new Container();
      this.tiles.x = this.x;
      this.tiles.y = this.y;
      this.velocity = {
        x: 0,
        y: 0
      };
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

    Platform.prototype.update = function(elapsedSec) {
      this.x += this.velocity.x * elapsedSec;
      this.y += this.velocity.y * elapsedSec;
      this.tiles.x = Math.round(this.x);
      return this.tiles.y = Math.round(this.y);
    };

    Platform.prototype.move = function(x, y) {
      if (x == null) x = -1;
      if (y == null) y = 0;
      this.tiles.x += x;
      return this.tiles.y += y;
    };

    Platform.prototype.isVisibleInCanvas = function(canvas) {
      return this.tiles.x + this.getWidth() >= 0 && this.tiles.x <= canvas.width;
    };

    Platform.prototype.getWidth = function() {
      if (this.width !== null) return this.width;
      return this.width = this.tileBitmap.width * this.widthByTiles;
    };

    return Platform;

  })();

}).call(this);
