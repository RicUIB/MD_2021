

filepath="data/combined_data_1.txt"



processFile = function(filepath) {
  filepath=fil
  con = file(filepath, "r")
  i=0
  while ( TRUE ) {
    
    line = readLines(con, n = 1)
    if ( line == "3:" ) {
      break
    }
    
    i=1+1
    print(c(i," ",line))
  }
  
  close(con)
}


processFile(filepath)



processFile = function(filepath) {
  con = file(filepath, "r")
  while ( TRUE ) {
    line = readLines(con, n = 1)
    if ( length(line) == 0 ) {
      break
    }
    print(line)
  }
  
  close(con)
}