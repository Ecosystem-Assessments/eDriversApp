# Parameters & data
source('./code/param.R')
source('./functions/serverSTL.R')
source('./functions/serverSS.R')

server = function(input, output, session) {
  # St. Lawrence
  serverStl(input, output, session)
  
  # Scotian Shelf
  serverSS(input, output, session)
}