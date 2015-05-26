#Library Required to handle json
library(rjson)

#Preparing the content output
setContentType("image/png")
t <- tempfile()
jpeg(t)

#Creating the data frame
data.json <- fromJSON(readLines(url("http://localhost:3000/data/babies.json")))
babies <- do.call("rbind", lapply(data.json, as.data.frame))

#convert fields from factor to numeric
babies$height <- as.numeric(as.character(babies$height))
babies$months_old <- as.numeric(as.character(babies$months_old))

#Linear regression
res=lm(babies$height~babies$months_old)

#Plot of the data as points with the regression line
plot(babies$months_old,babies$height, xlab="age (months)", ylab="height (cm)", xlim=c(17,36), ylim=c(76,88), main="Baby average height") + abline(res)

#Send the result
dev.off()
sendBin(readBin(t,'raw',n=file.info(t)$size))
unlink(t)
DONE
