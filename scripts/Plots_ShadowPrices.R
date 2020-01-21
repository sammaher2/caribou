#All the lines are overlappings

####PLOTS
#CARIBOU
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3,
     xlab="Caribou",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Caribou",
     cex.main = 1.4,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(-10000,250000), 
     yaxt = "n"
)
axis(side = 2, at=c(0,50000, 100000, 150000), labels=c("0", "50,000", "100,000", "150,000"))
lines(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3, lwd =3, lty = 3, col = "black")
#lines(caribou_spcA8$shadowcA8 ~ caribou_spcA8$cariboucA8, lwd =3, lty = 1, col = "black")
lines(caribou_spcB3$shadowcB3 ~ caribou_spcB3$cariboucB3, lwd =3, lty = 1, col = "black")
lines(caribou_spcB8$shadowcB8 ~ caribou_spcB8$cariboucB8, lwd =3, lty = 1, col = "purple")
lines(caribou_spcC3$shadowcC3 ~ caribou_spcC3$cariboucC3, lwd =3, lty = 5, col = "dark gray")
lines(caribou_spcC8$shadowcC8 ~ caribou_spcC8$cariboucC8, lwd =3, lty = 5, col = "purple")
legend("topright", legend = c("No Restoration", "Business as Usual, 3% discount rate", "Business as Usual, 8% discount rate", 
                               "Full Restoration, 3% discount rate", "Full Restoration, 8% discount rate"), 
       col = c("black", "black", "purple",  "dark grey", "purple"), 
       lty = c(3,1,1,5,5), lwd = c(2,2,2,2,2), cex = 1.2)

#ALT LEGEND
legend("bottomright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)

#WOLVES
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(wolf_spwA3$shadowwolfwA3 ~ wolf_spwA3$wolveswA3,
     xlab="Wolves",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Wolves",
     cex.main = 1.40,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0.0, 9000.0),
     ylim = c(-700000,50000),
     yaxt = "n"
)
axis(side = 2, at=c(0,-200000, -400000, -600000, -800000), labels=c("0","-200,000", "-400,000", "-600,000", "-800,000"))
lines(wolf_spwA3$shadowwolfwA3 ~ wolf_spwA3$wolveswA3, lwd =3,lty = 3, col = "black")
#lines(wolf_spwA8$shadowwolfwA8 ~ wolf_spwA8$wolveswA8, lwd =2,lty = 1, col = "black")
lines(wolf_spwB3$shadowwolfwB3 ~ wolf_spwB3$wolveswB3, lwd =3,lty = 1, col = "black")
lines(wolf_spwB8$shadowwolfwB8 ~ wolf_spwB8$wolveswB8, lwd =3,lty = 1, col = "purple")
lines(wolf_spwC3$shadowwolfwC3 ~ wolf_spwC3$wolveswC3, lwd =3, lty = 5, col = "dark gray")
lines(wolf_spwC8$shadowwolfwC8 ~ wolf_spwC8$wolveswC8, lwd =3, lty = 5, col = "purple")
legend("bottomright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)

#ALT LEGEND
legend("bottomright", legend = c("No Restoration", "Business as Usual, 3% discount rate", "Business as Usual, 8% discount rate", 
                              "Full Restoration, 3% discount rate", "Full Restoration, 8% discount rate"), 
       col = c("black", "black", "purple",  "dark grey", "purple"), 
       lty = c(3,1,1,5,5), lwd = c(2,2,2,2,2), cex = 1.2)


#UNGULATES
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(prey_spuA3$shadowpreyuA3 ~ prey_spuA3$ungulatesuA3,
     xlab="Prey",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Prey",
     cex.main = 1.40,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(500000, 1500000.0),
     ylim = c(-300,600.0),
     yaxt = "n",
     xaxt = "n"
)
axis(side = 2, at=c(-100, 0, 100, 200, 300), labels=c("-100", "0", "100", "200", "300"))
axis(side = 1, at=c(500000, 750000, 1000000, 1250000, 1500000), labels=c("500,000", "750,000","1,000,000","1,250,000", "1,500,000"))
lines(prey_spuA3$shadowpreyuA3 ~ prey_spuA3$ungulatesuA3, lwd =3,lty = 3, col = "black")
#lines(prey_spuA8$shadowpreyuA8 ~ prey_spuA8$ungulatesuA8, lwd =2,lty = 1, col = "black")
lines(prey_spuB3$shadowpreyuB3 ~ prey_spuB3$ungulatesuB3, lwd =3,lty = 1, col = "black")
lines(prey_spuB8$shadowpreyuB8 ~ prey_spuB8$ungulatesuB8, lwd =3,lty = 1, col = "purple")
lines(prey_spuC3$shadowpreyuC3 ~ prey_spuC3$ungulatesuC3, lwd =3, lty = 5, col = "dark gray")
lines(prey_spuC8$shadowpreyuC8 ~ prey_spuC8$ungulatesuC8, lwd =3, lty = 5, col = "purple")
legend("topright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)

#Linear Features
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(LF_spfA3$shadowLFfA3 ~ LF_spfA3$lfeaturesfA3,
     xlab="Kilometers of Legacy Linear Features",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Linear Features",
     cex.main = 1.40,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(50000, 300000.0),
     ylim = c(0,35000),
     yaxt = "n",
     xaxt= "n"
)
axis(side = 2, at=c(0, 5000, 10000, 15000, 20000, 30000), labels=c("0", "5000", "10000", "15000", "20000", "30000"))
axis(side = 1, at=c(50000, 100000, 150000, 200000, 250000, 300000),
     labels=c("50,000", "100,000", "150,000","200,000", "250,000", "300,000"))
lines(LF_spfA3$shadowLFfA3 ~ LF_spfA3$lfeaturesfA3, lwd =3,lty = 3, col = "black")
#lines(LF_spfA8$shadowLFfA8 ~ LF_spfA8$lfeaturesfA8, lwd =3,lty = 3, col = "purple")
lines(LF_spfB3$shadowLFfB3 ~ LF_spfB3$lfeaturesfB3, lwd =3,lty = 1, col = "black")
#lines(LF_spfB8$shadowLFfB8 ~ LF_spfB8$lfeaturesfB8, lwd =3,lty = 1, col = "purple")
lines(LF_spfC3$shadowLFfC3 ~ LF_spfC3$lfeaturesfC3, lwd =3, lty = 5, col = "dark grey")
#lines(LF_spfC8$shadowLFfC8 ~ LF_spfC8$lfeaturesfC8, lwd =3, lty = 5, col = "purple")

legend("topright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)
###ALT LEGEND
legend("topright", legend = c("No Restoration, 3% discount rate", "No Restoration, 8% discount rate", "Business as Usual, 3% discount rate", "Business as Usual, 8% discount rate", 
                                 "Full Restoration, 3% discount rate", "Full Restoration, 8% discount rate"), 
       col = c("black", "purple", "black", "purple",  "dark grey", "purple"), 
       lty = c(3,3,1,1,5,5), lwd = c(2,2,2,2,2,2), cex = .9)




#STATED PREFERENCE COMPARISON
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


#CARIBOU
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3,
     xlab="Caribou",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Caribou",
     cex.main = 1.4,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(-10000,250000), 
     yaxt = "n"
)
axis(side = 2, at=c(0,50000, 100000, 150000, 200000), labels=c("0", "50,000", "100,000", "150,000", "200,000"))
lines(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3, lwd =3, lty = 3, col = "black")
#lines(caribou_spcA8$shadowcA8 ~ caribou_spcA8$cariboucA8, lwd =3, lty = 1, col = "black")
lines(caribou_spcB3$shadowcB3 ~ caribou_spcB3$cariboucB3, lwd =3, lty = 1, col = "black")
#lines(caribou_spcB8$shadowcB8 ~ caribou_spcB8$cariboucB8, lwd =3, lty = 1, col = "purple")
lines(caribou_spcC3$shadowcC3 ~ caribou_spcC3$cariboucC3, lwd =3, lty = 5, col = "dark gray")
#lines(caribou_spcC8$shadowcC8 ~ caribou_spcC8$cariboucC8, lwd =3, lty = 5, col = "purple")

legend("topright", legend = c("Business as Usual", "Best Case Scenario", "Stated Preference (scale 100x revealed preference)"), 
       col = c("black", "dark grey", "red"), 
       lty = c(1,5,6), lwd = c(2,2,2), cex = 1.1)

par(new = T)
plot(con_deriv$marginalvalue ~ caribou_spcA3$cariboucA3, pch=16, axes=F, 
     xlab=NA, ylab=NA, cex=1.2, col = 'white', xlim = c(0, 10000),
     ylim = c(0.0, 25000000), xaxt = "n")
axis(side = 4, at=c(0,5000000,10000000,15000000, 20000000), las = 2, cex.axis = 1.0,
     labels=c("0", "5", "10", "15", "20"))
lines(con_deriv$marginalvalue ~ caribou_spcA3$cariboucA3, lwd = 2, lty = 6,col = "red")
#mtext(side = 4, line = 3, 'Ungulate Population', outer = "true")
