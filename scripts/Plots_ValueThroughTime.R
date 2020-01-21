#########################################################
#TOTAL VALUE CHANGE
#TOTAL WILDLIFE


par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(deltavalueTOTvD3$wildlife ~ deltavalueTOTvD3$year,
     xlab="Year",
     ylab="Net Change in Value (millions CAD)",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.3,
     cex = .05,
     col = "white",
     xlim = c(0,100),
     xaxs = "i",
     yaxs = "i",
     ylim = c(-700000000, 400000000),
     yaxt = "n",
     cex.axis = 1.2
)
axis(side = 2, at=c(400000000, 200000000, 0, -200000000, -400000000, -600000000, -800000000), 
     cex.axis = 1.2,
     labels=c("400", "200", "0", "-200", "-400", "-600", "-800"))
zero <- rep(0,110)
lines(zero, col = "black", lty = 6, lwd = 1)
lines(deltavalueTOTvD3$wildlife ~ deltavalueTOTvD3$year, col = "red", lty = 3, lwd =3)
lines(deltavalueTOTvD8$wildlife ~ deltavalueTOTvD8$year, col = "purple", lty = 3, lwd =3)
#lines(deltavalueTOTvA3$wildlife ~ deltavalueTOTvA3$year, col = "black", lty = 3, lwd =2)
#lines(deltavalueTOTvA8$wildlife ~ deltavalueTOTvA8$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOTvB3$wildlife ~ deltavalueTOTvB3$year, col = "black", lty = 1, lwd =2)
lines(deltavalueTOTvB8$wildlife ~ deltavalueTOTvB8$year, col = "purple", lty = 1, lwd =2)
lines(deltavalueTOTvC3$wildlife ~ deltavalueTOTvC3$year, col = "dark grey", lty = 5, lwd =2)
lines(deltavalueTOTvC8$wildlife ~ deltavalueTOTvC8$year, col = "purple", lty = 5, lwd =2)

legend("topright", legend = c("Business as Usual", "Business as Usual w/ Wolf Mgmt", "Full Restoration"), 
       col = c( "black", "red", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,3,2), cex = 1.25)
#ALT LEGEND
legend("topright", legend = c("Wolf Ceiling, 3% discount rate", "Wolf Ceiling, 8% discount rate", "Business as Usual, 3% discount rate", "Business as Usual, 8% discount rate", 
                                 "Full Restoration, 3% discount rate", "Full Restoration, 8% discount rate"), 
       col = c("red", "purple", "black", "purple",  "dark grey", "purple"), 
       lty = c(3,3,1,1,5,5), lwd = c(2,2,2,2,2,2), cex = 1.0)


#Dynamics 1980 to 2080
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(sim.out$xs ~ sim.out$timeline,
     las = 0,
     lwd=2, col="white",
     xlim = c(1980, 2080.0),
     ylim = c(0.0, 11000.0),
     xlab="Year",
     ylab="",
     cex.lab = 1.5,
     cex.main = 1.2,
     cex.axis = 1.4,
     yaxt = "n")
axis(side = 2, at=c(0,2500, 5000, 7500, 10000), cex.axis = 1.25, labels=c("0", "2,500", "5,000", "7,500", "10,000"))
lines(sim.out$xs~ sim.out$timeline, lwd=2, lty = 1, col="blue")
lines(sim.out$zs ~ sim.out$timeline,lwd=2, lty = 1, col="purple")
legend("topright", legend = c("Caribou", "Wolves", "Ungulates", "Legacy Linear Features"), 
       col = c("blue", "purple", "red", "orange"), 
       lty = c(1,1,6,6), lwd = c(2,2,2,2), cex = 1.2)

par(new = T)
plot(sim.out$ys ~ sim.out$timeline, pch=16, axes=F, 
     xlab=NA, ylab=NA, cex=1.2, col = 'white', xlim = c(1980, 2080.0),
     ylim = c(0.0, 1700000.0), xaxt = "n")
axis(side = 4, at=c(0,500000,1000000,1500000), cex.axis = 1.25, labels=c("0", "500,000", "1,000,000", "1,500,000"))
lines(sim.out$ys ~ sim.out$timeline, lwd=2, lty = 6, col="red") 
lines(sim.out$ls ~ sim.out$timeline, lwd = 2, lty = 6, col = "orange")
#mtext(side = 4, line = 3, 'Ungulate Population', outer = "true")

#Linear feature dynamics by year
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(sim.out$ls ~ sim.out$timeline, col="white", 
     xlim = c(1980,2080),
     ylim = c(0.0,300000),
     cex.main = 1.2,
     cex.lab = 1.1,
     xlab="Year",
     ylab="Kilometers of Linear Features",
     yaxt ="n")
axis(side = 2, at=c(0,100000,200000,300000),
     labels=c("0", "100,000", "200,000", "300,000"))
lines(sim.out$ls ~ sim.out$timeline, lwd = 2, lty = 3, col = "black")
lines(sim.out$ls ~ sim.out$timeline, lwd = 2, lty = 1, col = "black")
lines(sim.out$ls ~ sim.out$timeline, lwd = 3, lty =5, col = "dark grey")
legend("bottomleft", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,3,2), cex = 1.2)

cariboux <- seq(from = 101, to = 6100, by = 1)
ungulatesx <- rep(endP, 6000)
wolvesx <- rep(endW, 6000)
lfeaturesx <- rep(endL, 6000)
xyzlx <- cbind(cariboux, ungulatesx, wolvesx, lfeaturesx)
xyzlx <- as.data.frame(xyzlx, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(xyzl)