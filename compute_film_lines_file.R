


for(i in 1:4){
  netflix=read_tsv(paste0("data/combined_data_",i,".txt"),n_max = Inf,col_names = FALSE)
  netflix=netflix%>% mutate(fila=row_number())
  filas=grep(":",netflix$X1)
  #save(filas,file="data/filas_1.Robj")
  filas_ID= netflix %>%
    filter( fila %in% filas ) %>%
    mutate(ID=as.integer(gsub(":","",X1)))
  #IDs=unique(filas_ID$X1)
  reps=diff(c(filas_ID$fila,max(netflix$fila)+1))
  filas_ID =filas_ID %>% mutate(fila_final=c(filas_ID$fila[-1]-1,dim(netflix)[1]),file_num=rep(i,dim(filas_ID)[1]))
write_csv(filas_ID,paste0("data/filas_ID_combined_",i,".txt"))
}


filas_all=read_csv(paste0("data/filas_ID_combined_",1,".txt"),n_max = Inf,col_names = TRUE)

for(i in 2:4){
  filas_all=rbind(filas_all,read_csv(paste0("data/filas_ID_combined_",i,".txt"),n_max = Inf,col_names = TRUE))
}

write_csv(filas_all,"data/filas_ID_combined_all.txt")
dim(filas_all)
all(filas_all$ID==1:dim(filas_all)[1])
