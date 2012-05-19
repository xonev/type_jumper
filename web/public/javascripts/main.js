(function() {
  var init;

  init = function() {
    var canvas, ninja, stage;
    canvas = document.getElementById('game');
    stage = new Stage(canvas);
    ninja = new Bitmap('/images/stick-ninja.png');
    ninja.x = 320;
    ninja.y = 240;
    stage.addChild(ninja);
    Ticker.setFPS(60);
    return Ticker.addListener(stage);
  };

  document.onreadystatechange = function() {
    if (document.readyState === 'complete') return init();
  };

}).call(this);
