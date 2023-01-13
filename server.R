# Parameters & data
source('./code/param.R')

server = function(input, output, session) {
  # St. Lawrence
  serverStl(input, output, session)
  
  # Scotian Shelf
  serverSS(input, output, session)
}