load("C:/Users/arora/Downloads/ICPSR_37922-V1/ICPSR_37922/DS0001/37922-0001-Data.rda")
data = da37922.0001
mdata = data.frame()

for (i in 1:nrow(data)){
  for (j in 1:ncol(data)){
    mdata[i,j] = substr(data[i,j], 1, 2) 
  }
}
mdata1 = data.frame()
for (i in 1:nrow(data)){
  for (j in 1:ncol(data)){
    mdata1[i,j] = substr(mdata[i,j],  2, 2)
  }
}

mdata2 = mdata1[ , colSums(is.na(mdata1)) == 0]
mydata1 <- cbind(data[,1:2],mdata1[,3],mdata2[,4:(ncol(mdata2)-1)])

mydata = mydata1[complete.cases(mydata1), ]
