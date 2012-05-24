(function() {
  var init;

  init = function() {
    var canvas, contentLoader;
    canvas = document.getElementById('game');
    contentLoader = new NT.ContentLoader();
    return contentLoader.startDownload(function() {
      var game;
      game = new NT.Game(canvas, contentLoader);
      return game.loadLevel([
        {
          word: "N"
        }, {
          word: "I"
        }, {
          word: "N"
        }, {
          word: "J"
        }, {
          word: "A"
        }
      ]);
    });
  };

  document.onreadystatechange = function() {
    if (document.readyState === 'complete') return init();
  };

}).call(this);
