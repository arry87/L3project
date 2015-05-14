library(stringr)

DF.Test <- read_data("test")
DF.Train <- read_data("train")

Merged.Data <- rbind(DF.Test, DF.Train)

n1 <- max(as.numeric(Merged.Data$Subject))
n2 <- max(as.numeric(Merged.Data$Activity))

rows <- n1*n2

avg.data <- matrix(nrow = rows, ncol = length(Merged.Data))
sub <- vector("character", length=rows)
act <- vector("character", length=rows)

spl.act <- split(Merged.Data, Merged.Data$Activity)

for (i in 1:n2) {
  
    temp <- split(spl.act[[i]], spl.act[[i]]$Subject)
    
    for (j in 1:n1) {
      
        for (k in 3:length(Merged.Data)) {
          
            ind <- j + (i-1)*n1
            y <- temp[[j]]
            avg.data[ind,k] <- mean(y[,k], na.rm = TRUE)
            sub[ind] <- names(temp)[j]
            act[ind] <- names(spl.act)[i]
          
        }
      
    }
  
}

avg.data <- avg.data[,3:length(Merged.Data)]
df1 <- as.data.frame(avg.data)
names(df1) <- names(Merged.Data)[3:81]
df2 <- as.data.frame(sub)
names(df2) <- "Subject"
df3 <- as.data.frame(act)
names(df3) <- "Activity"

DATA.NEAT <- cbind(df3, df2, df1)
