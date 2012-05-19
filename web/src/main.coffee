init = () ->
  canvas = document.getElementById 'game'
  stage = new Stage(canvas)
  ninja = new Bitmap('/images/stick-ninja.png')
  ninja.x = 320
  ninja.y = 240
  stage.addChild(ninja)
  Ticker.setFPS(60)
  Ticker.addListener(stage)

document.onreadystatechange = () ->
  if document.readyState == 'complete'
    init()