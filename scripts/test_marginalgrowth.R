#TEST CODE FOR MARGINAL GROWTH
######Caribou Shadow Price
cariboucA3 <- seq(from = 1, to = 10000, by = 10)
ungulatescA3 <- rep(endP, 1000)
wolvescA3 <- rep(endW, 1000)
lfeaturescA3 <- rep(endL, 1000)
cA3xyzl <- cbind(cariboucA3, ungulatescA3, wolvescA3, lfeaturescA3)
cA3xyzl <- as.data.frame(cA3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))


caribou_datat <- matrix(0,nrow = length(sim.out$xs), ncol = 7)
#simulate at nodes
for(j in 1:length(sim.out$xs)){
  caribou_datat[j,1]<-sim.out[j,1]
  caribou_datat[j,2]<-sim.out[j,2]
  caribou_datat[j,3]<-sim.out[j,3]
  caribou_datat[j,4]<-sim.out[j,4]
  caribou_datat[j,5]<-sim.out[j,5]
  caribou_datat[j,6]<-lf_reclaim(sim.out[j,2], sim.out[j,5], sim.parmsW)
  caribou_datat[j,7]<-restorelf(sim.out[j,2], sim.out[j,5], sim.parmsE)
 # caribou_datat[j,6]<-wval(sim.out[j,1], sim.out[j,2], sim.out[j,3], sim.out[j,4], sim.parmsW)
 }
colnames(caribou_datat) <- c("time", "caribou", "prey", "wolves", "lfs", "costreclaim", "numreclaim")
caribou_datat <- as.data.frame(caribou_datat)
plot(caribou_datat$costreclaim ~ caribou_datat$time)
plot(caribou_datat$restorelf ~ caribou_datat$time)


######Caribou Shadow Price
cariboucF3 <- seq(from = 1, to = 10000, by = 10)
ungulatescF3 <- rep(endP, 1000)
wolvescF3 <- rep(endW, 1000)
lfeaturescF3 <- rep(endL, 1000)
cF3xyzl <- cbind(cariboucF3, ungulatescF3, wolvescF3, lfeaturescF3)
cF3xyzl <- as.data.frame(cF3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))


caribou_datat <- matrix(0,nrow = length(cF3xyzl$cariboucF3), ncol = 6)
#simulate at nodes
for(j in 1:length(cF3xyzl$cariboucF3)){
  caribou_datat[j,1]<-cF3xyzl[j,1]
  caribou_datat[j,2]<-cF3xyzl[j,2]
  caribou_datat[j,3]<-cF3xyzl[j,3]
  caribou_datat[j,4]<-cF3xyzl[j,4]
  caribou_datat[j,5]<-lf_reclaim(cF3xyzl[j,1], cF3xyzl[j,4], sim.parmsW)
  caribou_datat[j,6]<-restorelf(cF3xyzl[j,1], cF3xyzl[j,4], sim.parmsE)
  #caribou_data1[j,6]<-ydot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
  #caribou_data1[j,7]<-zdot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
 # caribou_data1[j,8]<-ldot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
 # caribou_data1[j,9]<-wval(xs[j], ys[j], zs[j], ls[j], sim.parmsW)
}

colnames(caribou_datat) <- c("caribou", "prey", "wolves", "lfs", "costreclaim", "numreclaim")
caribou_datat <- as.data.frame(caribou_datat)
plot(caribou_datat$costreclaim ~ caribou_datat$caribou)



caribou_data3 <- as.data.frame(caribou_data)  #70, .25
caribou_data4 <- as.data.frame(caribou_data)  #yo, .50


#CARIBOU GROWTH RATES
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_data1$caribougrowth ~ caribou_data1$caribou,
     xlab="Caribou",
     ylab="Caribou Marginal Growth",
     main = "Shadow Price of Caribou",
     cex.main = 1.4,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0, 10000.0),
     ylim = c(-1.0, 0) 
     # yaxt = "n"
)
#axis(side = 2, at=c(0,-250, -500, -1000), labels=c("0", "-250", "-500", "-1000"))
lines(caribou_data1$caribougrowth ~ caribou_data1$caribou, lwd =2, lty = 1, col = "green") #2017 25 3%
lines(caribou_data2$caribougrowth ~ caribou_data2$caribou, lwd =2, lty = 1, col = "red") #2017 25 3%

legend("topright", legend = c("BAU 2017, 3%", "BAU 2000, 3%"), 
       col = c("green", "red"), 
       lty = c(1,1,1,5,1,5), lwd = c(2,2,2,2,2,2), cex = 1.2)



legend("topright", legend = c("BAU 2000, 3% discount rate", "BAU 2000, 8% discount rate", 
                              "BAU 2017, 3% discount rate", "BAU 2017 8% discount rate", 
                              "Full 2017, 3% discount rate", "Full 2017 8% discount rate"), 
       col = c("black", "black", "green", "green", "purple", "purple"), 
       lty = c(1,5,1,5,1,5), lwd = c(2,2,2,2,2,2), cex = 1.2)
