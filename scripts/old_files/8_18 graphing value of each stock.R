#Errors in this code!
#Lines are either overlapping or not plotting. Throwing erors. 
#deltavalueTOT2 doesn't exist yet: The reason for this is that 8_19 must be ran first
#Then throws error that variable lengths are differing

#########################################################
#TOTAL VALUE CHANGE
#TOTAL WILDLIFE
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(deltavalueTOT2$wildlife ~ deltavalueTOT2$year,
     xlab="Year",
     ylab="Net Change in Value (millions)",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.3,
     cex = .05,
     col = "white",
     xlim = c(0,100),
     xaxs = "i",
     yaxs = "i",
     ylim = c(-500000000, 200000000),
     yaxt = "n",
     cex.axis = 1.2
)
axis(side = 2, at=c(100000000, 0, -100000000, -200000000, -300000000, -400000000, -500000000), 
     cex.axis = 1.2,
     labels=c("100", "0", "-100", "-200", "-300", "-400","-500"))
zero <- rep(0,110)
lines(zero, col = "black", lty = 6, lwd = 1)
lines(deltavalueTOT$wildlife ~ deltavalueTOT$year, col = "red", lty = 3, lwd =3)
lines(deltavalueTOT2$wildlife ~ deltavalueTOT2$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOT3$wildlife ~ deltavalueTOT3$year, col = "dark grey", lty = 5, lwd =3)

legend("topright", legend = c("Business as Usual", "Business as Usual w/ Wolf Mgmt", "Full Restoration"), 
       col = c( "black", "red", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,3,2), cex = 1.25)



##CHANGE IN VALUE
#TOTAL WILDLIFE
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Yearly Change in Value Stored in Wildlife",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-30000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, -10000000,-20000000, -30000000), 
     labels=c("0", "-10 million", "-20 million", "-30 million"))
lines(deltavalue$wildlife ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalue2$wildlife ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalue3$wildlife ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("bottomright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

##CARIBOU YEARLY CHANGE
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Yearly Change in Value Stored in Caribou",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-15000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, -5000000,-10000000, -15000000), 
     labels=c("0", "-10 million", "-20 million", "-30 million"))
lines(deltavalue$caribou ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalue2$caribou ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalue3$caribou ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("bottomright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

##UGULATES YEARLY CHANGE
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Yearly Change in Value Stored in Prey",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-100000, 100000),
     yaxt = "n"
)
axis(side = 2, at=c(0, -100000,-50000, 0, 50000, 10000), 
     labels=c("0","-100,000", "-50,000", "0", "50,000", "100,000"))
lines(deltavalue$ungulates ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalue2$ungulates ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalue3$ungulates ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("bottomright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

##Wolves YEARLY CHANGE
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Yearly Change in Value Stored in Wolves",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110), 
     ylim = c(-15000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, -5000000, -10000000, -15000000), 
     labels=c('0', '-5 illion', '-10 million', '-15 million'))
lines(deltavalue$wolves ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalue2$wolves ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalue3$wolves ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("bottomright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

#
#TOTAL VALUE CHANGE
#TOTAL CARIBOU
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Net Change in Value Stored in Caribou Stock",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-300000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, -100000000, -200000000, -300000000), 
     labels=c("0","-100 million", "-200 million", "-300 million"))
lines(deltavalueTOT$caribou ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalueTOT2$caribou ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOT3$caribou ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("topright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

#TOTAL VALUE CHANGE
#TOTAL UNGULATES
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Net Change in Value Stored in Prey Stock",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-1000000, 3000000),
     yaxt = "n"
)
axis(side = 2, at=c(0, 1000000, 2000000, 3000000), 
     labels=c("0","10 million", "20 million", "30 million"))
lines(deltavalueTOT$ungulates ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalueTOT2$ungulates ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOT3$ungulates ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("bottomright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)

#TOTAL VALUE CHANGE
#TOTAL WOLVES
par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Net Change in Value Stored in Wolf Stock",
     main = "",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-300000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, -100000000, -200000000, -300000000), 
     labels=c("0","-100 million", "-200 million", "-300 million"))
lines(deltavalueTOT$wolves ~ deltavalue$year, col = "grey", lty = 5, lwd =2)
lines(deltavalueTOT2$wolves ~ deltavalue2$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOT3$wolves ~ deltavalue3$year, col = "dark grey", lty = 3, lwd =2)
legend("topright", legend = c("No Restoration", "Business as Usual", "Best Case Scenario"), 
       col = c("grey", "black", "dark grey"), 
       lty = c(5,1,3), lwd = c(2,2,2), cex = 1)


