(function() {
  var NT;

  NT = window.NT || {};

  window.NT = NT;

  NT.Level = (function() {
    var moveVelocity;

    function Level(canvas, contentLoader, jsonLevel) {
      var background, g, ninjaBmp;
      this.canvas = canvas;
      this.contentLoader = contentLoader;
      this.lastElapsed = 0;
      g = new Graphics();
      g.beginLinearGradientFill(["#369", "#036"], [0, 1], 0, 0, 0, this.canvas.height).drawRect(0, 0, this.canvas.width, this.canvas.height).draw(this.canvas.getContext("2d"));
      background = new Shape(g);
      background.cache(0, 0, this.canvas.width, this.canvas.height);
      this.stage = new Stage(this.canvas);
      this.stage.addChild(background);
      ninjaBmp = new Bitmap(this.contentLoader.imgNinja);
      this.ninja = new NT.Ninja(ninjaBmp, 320, 240);
      this.stage.addChild(this.ninja.getDisplayObject());
      this.load(jsonLevel);
      Ticker.addListener(this);
      Ticker.setFPS(60);
    }

    Level.prototype.load = function(jsonLevel) {
      var PLATFORM_GAP_SPACING, WORD_HEIGHT_DELTA, lastPlatform, platformDef, platformTile, word, x, _i, _len, _results;
      platformTile = new Bitmap(this.contentLoader.imgTile);
      platformTile.width = this.contentLoader.imgTile.width;
      platformTile.height = this.contentLoader.imgTile.height;
      this.platforms = [];
      this.words = [];
      x = 0;
      PLATFORM_GAP_SPACING = 80;
      WORD_HEIGHT_DELTA = 150;
      _results = [];
      for (_i = 0, _len = jsonLevel.length; _i < _len; _i++) {
        platformDef = jsonLevel[_i];
        lastPlatform = new NT.Platform(platformDef.word.length, platformTile, x, this.canvas.height - 60);
        this.platforms.push(lastPlatform);
        word = new NT.Word(platformDef.word, x + lastPlatform.getWidth() + (PLATFORM_GAP_SPACING / 2), lastPlatform.tiles.y - WORD_HEIGHT_DELTA);
        this.words.push(word);
        _results.push(x += lastPlatform.getWidth() + PLATFORM_GAP_SPACING);
      }
      return _results;
    };

    Level.prototype.startLevel = function() {
      var platform, word, _i, _j, _len, _len2, _ref, _ref2, _results;
      _ref = this.platforms;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        platform = _ref[_i];
        this.stage.addChild(platform.getDisplayObject());
      }
      _ref2 = this.words;
      _results = [];
      for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
        word = _ref2[_j];
        _results.push(this.stage.addChild(word.getDisplayObject()));
      }
      return _results;
    };

    moveVelocity = -600;

    Level.prototype.tick = function() {
      var currentElapsed, elapsedSec;
      elapsedSec = Ticker.getTime(false);
      currentElapsed = (elapsedSec - this.lastElapsed) / 1000;
      this.lastElapsed = elapsedSec;
      return this.stage.update();
    };

    return Level;

  })();

}).call(this);
