#########################################################
#TOTAL VALUE CHANGE
#TOTAL WILDLIFE

tiff(P("images/valuetime.tif"), res=600, compression = "lzw", height=5, width=6, units="in")
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(deltavalueTOTvD3$wildlife ~ deltavalueTOTvD3$year,
     xlab="Year",
     ylab="Net Change in Value (millions CAD)",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.0,
     cex = .05,
     col = "white",
     xlim = c(0,100),
     xaxs = "i",
     yaxs = "i",
     ylim = c(-1400000000,200000000),
     yaxt = "n",
     cex.axis = 1.2
)
axis(side = 2, at=c(500000000, 0, -500000000, -1000000000), 
     cex.axis = 1.1,
     labels=c("500", "0", "-500", "-1000"))
zero <- rep(0,110)
lines(zero, col = "black", lty = 1, lwd = 1)
eight <- rep(-800000000,110)
twent <- rep(-1250000000,110)

lines(zero, col = "black", lty = 1, lwd = 1)
lines(eight, col = "black", lty = 3, lwd = 1)
lines(twent, col = "purple", lty = 3, lwd =1)
#lines(deltavalueTOTvA8$wildlife ~ deltavalueTOTvA8$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOTvB3$wildlife ~ deltavalueTOTvB3$year, col = "black", lty = 1, lwd =2)
#lines(deltavalueTOTvB8$wildlife ~ deltavalueTOTvB8$year, col = "black", lty = 5, lwd =2)
lines(deltavalueTOTvC3$wildlife ~ deltavalueTOTvC3$year, col = "purple", lty = 1, lwd =2)
#lines(deltavalueTOTvC8$wildlife ~ deltavalueTOTvC8$year, col = "purple", lty = 5, lwd =2)

# legend("topright", legend = c( "Business as Usual, 3% discount rate", "Business as Usual, 8% discount rate",
#                               "Full Restoration, 3% discount rate", "Full Restoration, 8% discount rate"),
#        col = c( "black", "black",  "purple", "purple"),
#        lty = c(1,5,1,5), lwd = c(2,2,2,2,2,2), cex = 1.0)

legend("topright", legend = c("Business as Usual", "Full Restoration"), 
       col = c( "black", "purple"), 
       lty = c(1,1,1), lwd = c(2,2,2), cex = 1.0)
dev.off()


tiff(P("images/inearfeature_dynamics.tif"), res=600, compression = "lzw", height= 5, width=6, units="in")
#Linear feature dynamics by year
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(sim.outA3$ls ~ sim.outA3$timeline, col="white", 
     xlim = c(1980,2080),
     ylim = c(0.0,300000),
     cex.main = 1.2,
     cex.lab = 1.1,
     xlab="Year",
     ylab="Kilometers of Linear Features",
     yaxt ="n")
axis(side = 2, at=c(0,100000,200000,300000),
     labels=c("0", "100,000", "200,000", "300,000"))
lines(sim.outA3$ls ~ sim.outA3$timeline, lwd = 2, lty = 3, col = "black")
lines(sim.outB3$ls ~ sim.outB3$timeline, lwd = 2, lty = 1, col = "black")
lines(sim.outC3$ls ~ sim.outC3$timeline, lwd = 2, lty =1, col = "purple")
legend("bottomleft", legend = c( "No Restoration","Business as Usual","Full Restoration"), 
       col = c("black", "black", "purple"), 
       lty = c(3,1,1), lwd = c(2,2,2), cex = 1.0)
dev.off()


cariboux <- seq(from = 101, to = 6100, by = 1)
ungulatesx <- rep(endP, 6000)
wolvesx <- rep(endW, 6000)
lfeaturesx <- rep(endL, 6000)
xyzlx <- cbind(cariboux, ungulatesx, wolvesx, lfeaturesx)
xyzlx <- as.data.frame(xyzlx, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(xyzl)