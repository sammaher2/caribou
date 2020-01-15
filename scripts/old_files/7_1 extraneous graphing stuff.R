#BAU graphs, but not the ones that were published 
#Conservation Value (w/o capn) doesn't have anything graphed on it
#System Value Function (BAu) has lines flat on the bottom
#Shadow price of carbou: BAU    looks right
#Kilo of linear features has all overlapping lines
#Colorful graph has lines going through the key

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
       lty = c(1,1,6,6), lwd = c(2,2,2,2), cex = 1.4)

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


## Simulation data
csimx <- vsim(Caproxc,xyzlx)
View(csimx)

##SHADOW PRICE FOR CARIBOU UNDER BAU
shadowtempx <-csimx[[1]]
shadowCx <- shadowtempx[1:6000,1]
caribou_spx <- cbind(cariboux, shadowCx)
caribou_spx <- as.data.frame(caribou_spx)
par(mfcol = c(1,1))
plot(caribou_spx$shadowCx ~ caribou_spx$cariboux,
     xlab="Number of Caribou",
     ylab="Shadow Price (Marginal Value of Additional Caribou",
     main = "Shadow Price of Caribou: BAU",
     cex.main = 1.25,
     cex = .05,
     col = "white",
     xlim = c(0.0, 6000.0),
     ylim = c(0,200000)
)
lines(caribou_spx$shadowCx ~ caribou_spx$cariboux, lwd =2, col = "dark green")


##VALUE FUNCTION FOR SYSTEM
valuetempx <-csimx[[4]] 
valueCx <- valuetempx[1:6000,1]
valueCx <- valueCx/1000000000
caribou_Vx <- cbind(cariboux, valueCx)
caribou_Vx <- as.data.frame(caribou_Vx)
par(mfcol = c(1,1))
plot(caribou_Vx$valueCx ~ caribou_Vx$cariboux,
     xlab="Number of Caribou",
     ylab="Total Stored Value in Billions",
     main = "System Value Function (BAU)",
     cex.main = 1.5,
     cex = .05,
     col = "dark blue",
     xlim = c(0.0, 6000.0),
     ylim = c(0.0, 100)
)
lines(conservation_caribou$value~ conservation_caribou$caribou, lwd=2, col="orange")

##CONSERVATION VALUE OF CARIBOU (HARPER, stated preference)
length(cariboux)
conservation_caribou <- matrix(0,nrow = length(cariboux), ncol = 2,  dimnames = list(NULL,c("caribou","value")))
for(j in 1:length(caribou)){
  conservation_caribou[j,1]<-caribou[j]
  conservation_caribou[j,2]<-caribou_value(j, sim.parmsW)/1000000/.04
}

conservation_caribou <- as.data.frame(conservation_caribou)

plot(conservation_caribou$value ~ conservation_caribou$caribou,
     xlab="Number of Caribou",
     ylab="Total Stored Value in Millions",
     main = "Conservation Value (without capn)",
     cex.main = 1.25,
     cex = .05,
     col = "white",
     xlim = c(0.0, 6000.0),
     ylim = c(0.0,20000)
)
lines(conservation_caribou$value ~ conservation_caribou$caribou, col = "orange")

##MARGINAL VALUE OF CARIBOU (HARPER) PLOTTED AGAINST CAPN SHADOW PRICE
cariboux <-seq(from=1, to=10000, by = 10)
con_deriv <- matrix(0,nrow = length(cariboux), ncol = 2,  
                    dimnames = list(NULL,c("caribou","marginalvalue")))
for(j in 1:length(cariboux)){
  con_deriv[j,1]<-cariboux[j]
  con_deriv[j,2]<- con1*con2*households/(j+con2)^2/dr
}

con_deriv <- as.data.frame(con_deriv)

#CARIBOU
par(mfcol = c(1,1))
plot(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1,
     xlab="Number of Caribou",
     ylab="Price (dollars)",
     main = "Marginal Value of Caribou",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(0,15000000)
)
#lines(zero, col = "red")

lines(caribou_spc2$shadowC2 ~ caribou_spc2$caribouc2, lwd =2, lty = 1, col = "black")
lines(con_deriv$marginalvalue ~ caribou_spc3$caribouc3, lwd = 2, lty = 1,col = "red")
legend("topright", legend = c("BAU Shadow Price", "Stated Preference Method"), 
       col = c("black", "red"), 
       lty = c(1,1), lwd = c(2,2), cex = 1)


