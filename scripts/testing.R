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
     xlim = c(0, 10000.0),
     ylim = c(-10000,250000), 
     yaxt = "n"
)
axis(side = 2, at=c(0,50000, 100000, 150000), labels=c("0", "50,000", "100,000", "150,000"))
lines(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3, lwd =2, lty = 1, col = "green") #2017 25 3%
lines(caribou_spcA8$shadowcA8 ~ caribou_spcA8$cariboucA8, lwd =2, lty = 5, col = "green")  #2017 25 8%   3.5
lines(caribou_spcB3$shadowcB3 ~ caribou_spcB3$cariboucB3, lwd =2, lty = 1, col = "black") #2000 25 3%
lines(caribou_spcB8$shadowcB8 ~ caribou_spcB8$cariboucB8, lwd =2, lty = 5, col = "black") #2000 25 8%     6
lines(caribou_spcC3$shadowcC3 ~ caribou_spcC3$cariboucC3, lwd =2, lty = 1, col = "purple") #2017 50 3  WONKY
lines(caribou_spcC8$shadowcC8 ~ caribou_spcC8$cariboucC8, lwd =2, lty = 5, col = "purple")  #2017 50 8  WONKY    4
legend("topright", legend = c("BAU 2000, 3% discount rate", "BAU 2000, 8% discount rate", 
                              "BAU 2017, 3% discount rate", "BAU 2017 8% discount rate", 
                              "Full 2017, 3% discount rate", "Full 2017 8% discount rate"), 
       col = c("black", "black", "green", "green", "purple", "purple"), 
       lty = c(1,5,1,5,1,5), lwd = c(2,2,2,2,2,2), cex = 1.2)






#CARIBOU DISCOUNT RATES
#CARIBOU
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3,
     xlab="Caribou",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Caribou, Full Restoration 2000",
     cex.main = 1.4,
     cex.lab = 1.4,
     cex = .05,
     col = "white",
     xlim = c(0, 5000.0),
     ylim = c(0000,250000), 
     yaxt = "n"
)
axis(side = 2, at=c(0,50000, 100000, 150000), labels=c("0", "50,000", "100,000", "150,000"))
lines(caribou_spcA3$shadowcA3 ~ caribou_spcA3$cariboucA3, lwd =2, lty = 1, col = "red") #2017 25 3%
lines(caribou_spcA8$shadowcA8 ~ caribou_spcA8$cariboucA8, lwd =2, lty = 1, col = "orange")  #2017 25 4%
lines(caribou_spcB3$shadowcB3 ~ caribou_spcB3$cariboucB3, lwd =2, lty = 1, col = "green") #2000 25 5%
lines(caribou_spcB8$shadowcB8 ~ caribou_spcB8$cariboucB8, lwd =2, lty = 1, col = "blue") #2000 25 6%
lines(caribou_spcC3$shadowcC3 ~ caribou_spcC3$cariboucC3, lwd =2, lty = 1, col = "purple") #2017 25 7%
lines(caribou_spcC8$shadowcC8 ~ caribou_spcC8$cariboucC8, lwd =2, lty = 1, col = "black")  #2017 25 8%
legend("topright", legend = c("3%", "4%","5%","6%","7%","8%"), 
       col = c("red", "orange", "green", "blue", "purple", "black"), 
       lty = c(1,1,1,1,1), lwd = c(2,2,2,2,2,2), cex = 1.2)





#WOLVES

#wolf

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
     ylim = c(-1100000,100000),
     yaxt = "n"
)
axis(side = 2, at=c(0,-200000, -400000, -600000, -800000), labels=c("0","-200,000", "-400,000", "-600,000", "-800,000"))
lines(wolf_spwA3$shadowwolfwA3 ~ wolf_spwA3$wolveswA3, lwd =3,lty = 1, col = "green")
lines(wolf_spwA8$shadowwolfwA8 ~ wolf_spwA8$wolveswA8, lwd =2,lty = 5, col = "green")
lines(wolf_spwB3$shadowwolfwB3 ~ wolf_spwB3$wolveswB3, lwd =3,lty = 1, col = "black")
lines(wolf_spwB8$shadowwolfwB8 ~ wolf_spwB8$wolveswB8, lwd =3,lty = 5, col = "purple")
lines(wolf_spwC3$shadowwolfwC3 ~ wolf_spwC3$wolveswC3, lwd =3, lty = 1, col = "dark gray")
lines(wolf_spwC8$shadowwolfwC8 ~ wolf_spwC8$wolveswC8, lwd =3, lty = 5, col = "dark gray")

legend("bottomright", legend = c("Full 2000, 3% discount rate", "Full 2000, 8% discount rate", 
                              "Full 2017, 3% discount rate", "Full 2017 8% discount rate"), 
       col = c("dark grey", "dark grey", "green", "green"), 
       lty = c(1,5,1,5), lwd = c(2,2,2,2), cex = 1.2)


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
lines(prey_spuA3$shadowpreyuA3 ~ prey_spuA3$ungulatesuA3, lwd =2,lty = 1, col = "green")
lines(prey_spuA8$shadowpreyuA8 ~ prey_spuA8$ungulatesuA8, lwd =2,lty = 5, col = "green")
#lines(prey_spuB3$shadowpreyuB3 ~ prey_spuB3$ungulatesuB3, lwd =3,lty = 1, col = "black")
#lines(prey_spuB8$shadowpreyuB8 ~ prey_spuB8$ungulatesuB8, lwd =3,lty = 1, col = "purple")
lines(prey_spuC3$shadowpreyuC3 ~ prey_spuC3$ungulatesuC3, lwd =2, lty = 1, col = "dark gray")
lines(prey_spuC8$shadowpreyuC8 ~ prey_spuC8$ungulatesuC8, lwd =2, lty = 5, col = "dark grey")
legend("topright", legend = c("Full 2000, 3% discount rate", "Full 2000, 8% discount rate", 
                                 "Full 2017, 3% discount rate", "Full 2017 8% discount rate"), 
       col = c("dark grey", "dark grey", "green", "green"), 
       lty = c(1,5,1,5), lwd = c(2,2,2,2), cex = 1.2)


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
lines(LF_spfA3$shadowLFfA3 ~ LF_spfA3$lfeaturesfA3, lwd =3,lty = 1, col = "green")
lines(LF_spfA8$shadowLFfA8 ~ LF_spfA8$lfeaturesfA8, lwd =3,lty = 5, col = "green")
#lines(LF_spfB3$shadowLFfB3 ~ LF_spfB3$lfeaturesfB3, lwd =3,lty = 1, col = "black")
#lines(LF_spfB8$shadowLFfB8 ~ LF_spfB8$lfeaturesfB8, lwd =3,lty = 1, col = "purple")
lines(LF_spfC3$shadowLFfC3 ~ LF_spfC3$lfeaturesfC3, lwd =3, lty = 1, col = "dark grey")
lines(LF_spfC8$shadowLFfC8 ~ LF_spfC8$lfeaturesfC8, lwd =3, lty = 5, col = "dark grey")
legend("topright", legend = c("Full 2000, 3% discount rate", "Full 2000, 8% discount rate", 
                              "Full 2017, 3% discount rate", "Full 2017 8% discount rate"), 
       col = c("dark grey", "dark grey", "green", "green"), 
       lty = c(1,5,1,5), lwd = c(2,2,2,2), cex = 1.2)
