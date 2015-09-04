##Cayetano scripts=group
##Layer=raster
##Title=string Histogram of Raster Layer
##Breaks=number 10
##showplots

brks <- as.integer(Breaks)
lyr <- as.matrix(Layer)
clr <- "lightgreen"

hist(lyr,breaks=brks,main=Title,xlab="Layer",col=clr)
