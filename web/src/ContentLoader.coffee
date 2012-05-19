NT = window.NT || {}
window.NT = NT

class NT.ContentLoader
  constructor: () ->
    @NUM_OF_ELEMENTS_TO_DOWNLOAD = 2
    @numImagesLoaded = 0
    @imgNinja = new Image()
    @imgTile = new Image()
    
  startDownload: (@onDownloadComplete) =>
    throw "Missing download complete param" if @onDownloadComplete == null
    @setDownloadParameters @imgNinja, '/images/stick-ninja.png'
    @setDownloadParameters @imgTile, '/images/tile.png'
    
  setDownloadParameters: (imgElement, url) ->
    imgElement.src = url
    imgElement.onload = @handleImageLoad
    imgElement.onerror = @handleImageError
    
  handleImageLoad: (e) =>
    @numImagesLoaded++
    if @numImagesLoaded == @NUM_OF_ELEMENTS_TO_DOWNLOAD
      @numImagesLoaded = 0
      @onDownloadComplete()
      
  handleImageError: (e) ->
    console.log "Error loading iamge: " + e.target.src, e    