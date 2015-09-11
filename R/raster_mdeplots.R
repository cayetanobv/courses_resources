##Raster processing=group
##Layer = raster
##Title = string Raster Title
##Classes = number 20
##Contours = boolean True
##X_label = string X
##Y_label = string Y
##PDF = boolean False
##PDF_Folder = folder
##showplots

library("rasterVis")

if (PDF){
fl <- "/out_rasterplot.pdf"
fl_path <- paste(PDF_Folder,  fl, sep="")
dev.copy(pdf, fl_path)
}

cls <- as.integer(Classes)
clr_ramp <- terrain.colors(cls)

levelplot(Layer,col.regions=clr_ramp,contour=Contours,
main=list(Title),
xlab=list(X_label, fontface='bold'),
ylab=list(Y_label, rot=90, fontface='bold')
)
