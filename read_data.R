read_data <- function(mode) {
  
  
    if (mode == "test" | mode == "train") {
      
      filename <- "UCI_HAR_Dataset/features.txt"
      con <- file(filename)
      y <- readLines(con)
      close(con)
      ind.mean <- str_detect(y, "mean()")
      ind.std <- str_detect(y, "std()")
      columns <- ind.mean | ind.std
      col.names <- y[columns]
      num.cols <- length(col.names)
      
      for (i in 1:num.cols) {
        
          ind <- str_locate(col.names[i], " ")
          start.str <- ind[1,1] + 1
          col.names[i] <- str_sub(col.names[i], start = start.str, end = -1L )
          
      }
      
      
      
      filename <- paste("UCI_HAR_Dataset/", mode, "/X_", mode, ".txt", sep = "" )
      con <- file(filename)
      y <- readLines(con)
      close(con)
      num.rows <- length(y)
      
      data <- matrix(nrow = num.rows, ncol = num.cols)
      
      for (i in 1:num.rows) {
        
          z <- y[i]
          z <- str_split(z, " ")
          z <- as.numeric(z[[1]])
          z <- z[complete.cases(z)]
          z <- z[columns]
          data[i,] <- z
        
      }
      
      data.frame1 <- as.data.frame(data)
      names(data.frame1) <- col.names

      
      filename <-paste("UCI_HAR_Dataset/", mode, "/subject_", mode, ".txt", sep = "")
      con <- file(filename)
      y <- readLines(con)
      close(con)
      data.frame2 <- data.frame(Subject = y)
      
      filename <- paste("UCI_HAR_Dataset/", mode, "/y_", mode, ".txt", sep = "")
      con <- file(filename)
      y <- readLines(con)
      close(con)
      y <- as.numeric(y)
      act.names = vector("character", length(y))
      activity.name <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
      
      for (i in 1:length(y)) {
          
          act.names[i] <- activity.name[y[i]]
        
      }
      
      data.frame3 <- data.frame(Activity = act.names)
      
      
      DF.final <- cbind(data.frame3, data.frame2, data.frame1)
      DF.final
       
      
    } else {
      
        print("This is not an anticipated input to the function read_data. Please enter either test or train")
      
    }
  
  
}