init = () ->
  canvas = document.getElementById 'game'
  contentLoader = new NT.ContentLoader()
  contentLoader.startDownload ->
    Ticker.setFPS 60
    Ticker.addListener new NT.Game canvas, contentLoader

document.onreadystatechange = () ->
  if document.readyState == 'complete'
    init()