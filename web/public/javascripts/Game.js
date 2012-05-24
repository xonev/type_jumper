(function() {
  var NT;

  NT = window.NT || {};

  window.NT = NT;

  NT.Game = (function() {

    function Game(canvas, contentLoader) {
      this.canvas = canvas;
      this.contentLoader = contentLoader;
    }

    Game.prototype.loadLevel = function(jsonLevelDef) {
      this.level = new NT.Level(this.canvas, this.contentLoader, jsonLevelDef);
      return this.level.startLevel();
    };

    return Game;

  })();

}).call(this);
