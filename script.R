library(OmicCircos)
options(stringsAsFactors = FALSE)

seg_data = read.csv("segment.csv", header = TRUE)
mapping_data = read.csv("mapping.csv", header = TRUE)
link_data = read.csv("link.csv", header = TRUE) 
link_poly = read.csv("link_poly.csv", header = TRUE)
seg_name <- paste("chr", 1:3, sep="")


db       <- segAnglePo(seg_data, seg=seg_name)


colors   <- rainbow(7, alpha=0.5)

par(mar=c(2, 2, 2, 2))
plot(c(1,800), c(1,800), type="n", axes=FALSE, xlab="", ylab="", main="")

circos(R=400, cir=db, type="chr",  col=colors, print.chr.lab=TRUE, W=30, scale=FALSE, lwd = 10)

circos(R=390, cir=db, type="l",col.v = 4,mapping = mapping_data,B=TRUE, W=5, scale=TRUE, lwd=2)

circos(R=350, cir=db, W=20, mapping=link_data, type="link", lwd=3, col=colors[c(4:5)]);

circos(R=320, cir=db, W=20, mapping=link_poly, type="link.pg", lwd=3 , col=colors, scale=FALSE)



dev.off()

  