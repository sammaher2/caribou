####PLOTS
#CARIBOU
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1,
     xlab="Caribou",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Caribou",
     cex.main = 1.4,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(-10000,200000), 
     yaxt = "n"
)
axis(side = 2, at=c(0,50000, 100000, 150000, 200000), labels=c("0", "50,000", "100,000", "150,000", "200,000"))
lines(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1, lwd =3, lty = 3, col = "black")
lines(caribou_spc2$shadowC2 ~ caribou_spc2$caribouc2, lwd =3, lty = 1, col = "black")
lines(caribou_spc3$shadowC3 ~ caribou_spc3$caribouc3, lwd =3, lty = 5, col = "dark grey")
legend("topright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)


#WOLVES
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(wolf_spw2$shadowwolfw2 ~ wolf_spw2$wolvesw2,
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
lines(wolf_spw1$shadowwolfw1 ~ wolf_spw1$wolvesw1, lwd =3,lty = 3, col = "black")
lines(wolf_spw2$shadowwolfw2 ~ wolf_spw2$wolvesw2, lwd =2,lty = 1, col = "black")
lines(wolf_spw3$shadowwolfw3 ~ wolf_spw3$wolvesw3, lwd =3,lty = 5, col = "dark grey")
legend("bottomright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)


#UNGULATES
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(prey_spu1$shadowpreyu1 ~ prey_spu1$ungulatesu1,
     xlab="Prey",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Prey",
     cex.main = 1.40,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(500000, 1500000.0),
     ylim = c(-150,300.0),
     yaxt = "n",
     xaxt = "n"
)
axis(side = 2, at=c(-100, 0, 100, 200, 300), labels=c("-100", "0", "100", "200", "300"))
axis(side = 1, at=c(500000, 750000, 1000000, 1250000, 1500000), labels=c("500,000", "750,000","1,000,000","1,250,000", "1,500,000"))
lines(prey_spu1$shadowpreyu1 ~ prey_spu1$ungulatesu1, lwd =3,lty = 3, col = "black")
lines(prey_spu2$shadowpreyu2 ~ prey_spu2$ungulatesu2, lwd =2,lty = 1, col = "black")
lines(prey_spu3$shadowpreyu3 ~ prey_spu3$ungulatesu3, lwd =3,lty = 5, col = "dark grey")
legend("topright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)

#Linear Features
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(LF_spf1$shadowLFf1 ~ LF_spf1$lfeaturesf1,
     xlab="Kilometers of Legacy Linear Features",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Linear Features",
     cex.main = 1.40,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(50000, 300000.0),
     ylim = c(0,20000),
     yaxt = "n",
     xaxt= "n"
)
axis(side = 2, at=c(0, 5000, 10000, 15000, 20000), labels=c("0", "5000", "10000", "15000", "20000"))
axis(side = 1, at=c(50000, 100000, 150000, 200000, 250000, 300000),
     labels=c("50,000", "100,000", "150,000","200,000", "250,000", "300,000"))
lines(LF_spf1$shadowLFf1 ~ LF_spf1$lfeaturesf1, lwd =3,lty = 3, col = "black")
lines(LF_spf2$shadowLFf2 ~ LF_spf2$lfeaturesf2, lwd =2,lty = 1, col = "black")
lines(LF_spf3$shadowLFf3 ~ LF_spf3$lfeaturesf3, lwd =3,lty = 5, col = "dark grey")
legend("bottomright", legend = c("Business as Usual", "No Restoration", "Full Restoration"), 
       col = c("black", "black", "dark grey"), 
       lty = c(1,3,5), lwd = c(2,2,2), cex = 1.3)