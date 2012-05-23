init = () ->
  canvas = document.getElementById 'game'
  contentLoader = new NT.ContentLoader()
  contentLoader.startDownload ->    
    game = new NT.Game canvas, contentLoader
    game.loadLevel [
      {word: "N"},
      {word: "I"},
      {word: "N"},
      {word: "J"},
      {word: "A"},
    ]

document.onreadystatechange = () ->
  if document.readyState == 'complete'
    init()