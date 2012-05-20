init = () ->
  canvas = document.getElementById 'game'
  contentLoader = new NT.ContentLoader()
  contentLoader.startDownload ->    
    game = new NT.Game canvas, contentLoader
    game.loadLevel [
      {word: "test"},
      {word: "another test"}
    ]

document.onreadystatechange = () ->
  if document.readyState == 'complete'
    init()