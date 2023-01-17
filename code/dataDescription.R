dataDesc <- function(id, layers) {
  paste(
    # '<h1>',layers$Drivers[id],'<h1/>',
    '<h1>',layers$Groups[id],'<h1/>',
    '<h2>',layers$Drivers[id],'<h2/>',
    '<br/>',
    '<hr /><div class="pad">',
    '<br/>',
    '<h3>Data description<h3/>',
    '<h4><b>Spatial resolution</b>: ',layers$SpatRes[id],'<h4/>',
    '<h4><b>Temporal resolution</b>: ',layers$TempRes[id],'<h4/>',
    '<h4><b>Years</b>: ',layers$Years[id],'<h4/>',
    '<h4><b>Units</b>: ',withMathJax(layers$Units[id]),'<h4/>',
    '<h4><b>Transformations</b>: ',layers$DataTrans[id],'<h4/>',
    '<br/>',
    '<h3>Source &nbsp;', ifelse(layers$SourceLink[id] != '',
                          paste0('<a href="',layers$SourceLink[id],'" target="_blank"><i class="fa fa-globe" aria-hidden="true"></i></a><h3/>'),
                          '<h3/>'),
    '<h4>',layers$Source[id],'<h4/>',
    '<br/>'
  )
}

dataOver <- function(id, layers) {
  paste(
    '<br/>',
    '<h3>Overview<h3/>',
    '<h4>',layers$Overview[id],'<h4/>',
    '<br/>'
  )
}
