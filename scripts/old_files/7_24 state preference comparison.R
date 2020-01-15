#Lines are overlapping and key is on top of everything

##MARGINAL VALUE OF CARIBOU (HARPER) PLOTTED AGAINST CAPN SHADOW PRICE
cariboux <-seq(from=1, to=10000, by = 10)
con_deriv <- matrix(0,nrow = length(cariboux), ncol = 2,  
                    dimnames = list(NULL,c("caribou","marginalvalue")))
for(j in 1:length(cariboux)){
  con_deriv[j,1]<-cariboux[j]
  con_deriv[j,2]<- households*con1*con2/(j+con2)^2/dr
}

#View(caribou_spc2)
meep<- caribou_spc2[,2]/1256190.0 
#View(con_deriv)
con_deriv <- as.data.frame(con_deriv)

####PLOTS
#CARIBOU
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_spc2$shadowC2 ~ caribou_spc2$caribouc2,
     xlab="Caribou",
     ylab="",
     cex.lab = 1.6,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(0,200000), 
     yaxt = "n",
     cex.axis = 1.5
)
axis(side = 2, at=c(0,50000, 100000, 150000, 200000), las = 2, cex.axis = 1.4, labels=c("0", "50", "100", "150", "200"))
#lines(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1, lwd =2, lty = 4, col = "grey")
lines(caribou_spc2$shadowC2 ~ caribou_spc2$caribouc2, lwd =2, lty = 1, col = "black")
lines(caribou_spc3$shadowC3 ~ caribou_spc3$caribouc3, lwd =2, lty = 5, col = "dark grey")
#lines(con_deriv$marginalvalue ~ caribou_spc3$caribouc3, lwd = 2, lty = 5,col = "red")
legend("topright", legend = c("Business as Usual", "Best Case Scenario", "Stated Preference (scale 100x revealed preference)"), 
       col = c("black", "dark grey", "red"), 
       lty = c(1,5,6), lwd = c(2,2,2), cex = 1.3)

par(new = T)
plot(con_deriv$marginalvalue ~ caribou_spc2$caribouc2, pch=16, axes=F, 
     xlab=NA, ylab=NA, cex=1.2, col = 'white', xlim = c(0, 10000),
     ylim = c(0.0, 20000000), xaxt = "n")
axis(side = 4, at=c(0,5000000,10000000,15000000, 20000000), las = 2, cex.axis = 1.4,
     labels=c("0", "5", "10", "15", "20"))
lines(con_deriv$marginalvalue ~ caribou_spc2$caribouc2, lwd = 2, lty = 6,col = "red")
#mtext(side = 4, line = 3, 'Ungulate Population', outer = "true")

