#########################################################
#TOTAL VALUE CHANGE
#TOTAL WILDLIFE


par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(deltavalueTOTvD3$wildlife ~ deltavalueTOTvD3$year,
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
     ylim = c(-1000000000, 200000000),
     yaxt = "n",
     cex.axis = 1.2
)
axis(side = 2, at=c(100000000, 0, -100000000, -200000000, -300000000, -400000000, -500000000), 
     cex.axis = 1.2,
     labels=c("100", "0", "-100", "-200", "-300", "-400","-500"))
zero <- rep(0,110)
lines(zero, col = "black", lty = 6, lwd = 1)
lines(deltavalueTOTvA3$wildlife ~ deltavalueTOTvA3$year, col = "black", lty = 3, lwd =3)
lines(deltavalueTOTvA8$wildlife ~ deltavalueTOTvA8$year, col = "black", lty = 1,lwd =2)
lines(deltavalueTOTvB3$wildlife ~ deltavalueTOTvB3$year, col = "dark grey", lty = 5, lwd =3)
lines(deltavalueTOTvB8$wildlife ~ deltavalueTOTvB8$year, col = "dark grey", lty = 3, lwd =3)
lines(deltavalueTOTvC3$wildlife ~ deltavalueTOTvC3$year, col = "purple", lty = 5, lwd =3)
lines(deltavalueTOTvC8$wildlife ~ deltavalueTOTvC8$year, col = "purple", lty = 3, lwd =3)
lines(deltavalueTOTvD3$wildlife ~ deltavalueTOTvD3$year, col = "red", lty = 5, lwd =3)
lines(deltavalueTOTvD8$wildlife ~ deltavalueTOTvD8$year, col = "green", lty = 3, lwd =3)
legend("topright", legend = c("Business as Usual", "Business as Usual w/ Wolf Mgmt", "Full Restoration"), 
       col = c( "black", "red", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,3,2), cex = 1.25)