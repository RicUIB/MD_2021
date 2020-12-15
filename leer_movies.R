
library(tidyverse)

movie_titles=read_tsv("netflix/data/movie_titles.csv",
                      locale = readr::locale(encoding = "ISO-8859-1"),
                      col_names=FALSE)

movie_titles=movie_titles %>% separate(X1,",",into =c("ID_film","Year","Title"),extra="merge")


View(movie_titles)
