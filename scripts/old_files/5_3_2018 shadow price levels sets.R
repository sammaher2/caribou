#All the lines in each plot lay on top of one another. 

####Code for simulating price curves for each stock on same graph
zero <- rep (0,1500000)

#############SCENARIO 1, wolf escapement
######Caribou Shadow Price
caribouc1 <- seq(from = 1, to = 10000, by = 10)
ungulatesc1 <- rep(endP, 1000)
wolvesc1 <- rep(endW, 1000)
lfeaturesc1 <- rep(endL, 1000)
C1xyzl <- cbind(caribouc1, ungulatesc1, wolvesc1, lfeaturesc1)
C1xyzl <- as.data.frame(C1xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimC1 <- vsim(Caproxc,C1xyzl)
#View(csimC)
shadowtempc1 <-csimC1[[1]]
shadowC1 <- shadowtempc1[1:1000,1]
caribou_spc1 <- cbind(caribouc1, shadowC1)
caribou_spc1 <- as.data.frame(caribou_spc1)
####### WOLF SHADOW PRICE
caribouw1<- rep(endC, 1000)
ungulatesw1 <- rep(endP, 1000)
wolvesw1 <- seq(from = 1, to = 10000, by = 10)
lfeaturesw1 <- rep(endL, 1000)
W1xyzl <- cbind(caribouw1, ungulatesw1, wolvesw1, lfeaturesw1)
W1xyzl <- as.data.frame(W1xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimW1 <- vsim(Caproxc,W1xyzl)
#View(csimW)
shadowwolfw1 <-csimW1[[1]]
shadowwolfw1 <- shadowwolfw1[1:1000,3]
wolf_spw1 <- cbind(wolvesw1, shadowwolfw1)
wolf_spw1 <- as.data.frame(wolf_spw1)
####### Ungulates Shadow Price
caribouu1<- rep(endC, 1000)
ungulatesu1 <- seq(from =1, to = 1500000, by = 1500)
wolvesu1 <- rep(endW, 1000)
lfeaturesu1 <- rep(endL, 1000)
P1xyzl <- cbind(caribouu1, ungulatesu1, wolvesu1, lfeaturesu1)
P1xyzl <- as.data.frame(P1xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimP1 <- vsim(Caproxc,P1xyzl)
#View(csimP)
shadowpreyu1 <-csimP1[[1]]
shadowpreyu1 <- shadowpreyu1[1:1000,2]
prey_spu1 <- cbind(ungulatesu1, shadowpreyu1)
prey_spu1 <- as.data.frame(prey_spu1)
#######Linear Features Shadow Price
caribouf1<- rep(endC, 1000)
ungulatesf1 <- rep(endP, 1000)
wolvesf1 <- rep(endW, 1000)
lfeaturesf1 <- seq(from = 1, to = 300000, by = 300)
L1xyzl <- cbind(caribouf1, ungulatesf1, wolvesf1, lfeaturesf1)
L1xyzl <- as.data.frame(L1xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimL1 <- vsim(Caproxc,L1xyzl)
#View(csimL)
shadowLFf1 <- csimL1[[1]]
shadowLFf1 <- shadowLFf1[1:1000,4]
LF_spf1 <- cbind(lfeaturesf1, shadowLFf1)
LF_spf1<- as.data.frame(LF_spf1)


#############SCENARIO 2
######Caribou Shadow Price
caribouc2 <- seq(from = 1, to = 10000, by = 10)
ungulatesc2 <- rep(endP, 1000)
wolvesc2 <- rep(endW, 1000)
lfeaturesc2 <- rep(endL, 1000)
C2xyzl <- cbind(caribouc2, ungulatesc2, wolvesc2, lfeaturesc2)
C2xyzl <- as.data.frame(C2xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimC2 <- vsim(Caproxc,C2xyzl)
#View(csimC)
shadowtempc2 <-csimC2[[1]]
shadowC2 <- shadowtempc2[1:1000,1]
caribou_spc2 <- cbind(caribouc2, shadowC2)
caribou_spc2 <- as.data.frame(caribou_spc2)
####### WOLF SHADOW PRICE
caribouw2<- rep(endC, 1000)
ungulatesw2 <- rep(endP, 1000)
wolvesw2 <- seq(from = 1, to = 10000, by = 10)
lfeaturesw2 <- rep(endL, 1000)
W2xyzl <- cbind(caribouw2, ungulatesw2, wolvesw2, lfeaturesw2)
W2xyzl <- as.data.frame(W2xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimW2 <- vsim(Caproxc,W2xyzl)
#View(csimW)
shadowwolfw2 <-csimW2[[1]]
shadowwolfw2 <- shadowwolfw2[1:1000,3]
wolf_spw2 <- cbind(wolvesw2, shadowwolfw2)
wolf_spw2 <- as.data.frame(wolf_spw2)
####### Ungulates Shadow Price
caribouu2<- rep(endC, 1000)
ungulatesu2 <- seq(from =1, to = 1500000, by = 1500)
wolvesu2 <- rep(endW, 1000)
lfeaturesu2 <- rep(endL, 1000)
P2xyzl <- cbind(caribouu2, ungulatesu2, wolvesu2, lfeaturesu2)
P2xyzl <- as.data.frame(P2xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimP2 <- vsim(Caproxc,P2xyzl)
#View(csimP)
shadowpreyu2 <-csimP2[[1]]
shadowpreyu2 <- shadowpreyu2[1:1000,2]
prey_spu2 <- cbind(ungulatesu2, shadowpreyu2)
prey_spu2 <- as.data.frame(prey_spu2)
#######Linear Features Shadow Price
caribouf2<- rep(endC, 1000)
ungulatesf2 <- rep(endP, 1000)
wolvesf2 <- rep(endW, 1000)
lfeaturesf2 <- seq(from = 1, to = 300000, by = 300)
L2xyzl <- cbind(caribouf2, ungulatesf2, wolvesf2, lfeaturesf2)
L2xyzl <- as.data.frame(L2xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimL2 <- vsim(Caproxc,L2xyzl)
#View(csimL)
shadowLFf2 <- csimL2[[1]]
shadowLFf2 <- shadowLFf2[1:1000,4]
LF_spf2 <- cbind(lfeaturesf2, shadowLFf2)
LF_spf2<- as.data.frame(LF_spf2)

#SCENARIO 3
######Caribou Shadow Price
caribouc3 <- seq(from = 1, to = 10000, by = 10)
ungulatesc3 <- rep(endP, 1000)
wolvesc3 <- rep(endW, 1000)
lfeaturesc3 <- rep(endL, 1000)
C3xyzl <- cbind(caribouc3, ungulatesc3, wolvesc3, lfeaturesc3)
C3xyzl <- as.data.frame(C3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
##HOW DO I CHANGE THE DANG COLUMN TITLESS
## Simulation data
csimC3 <- vsim(Caproxc,C3xyzl)
#View(csimC)
shadowtempc3 <-csimC3[[1]]
shadowC3 <- shadowtempc3[1:1000,1]
caribou_spc3 <- cbind(caribouc3, shadowC3)
caribou_spc3 <- as.data.frame(caribou_spc3)
####### WOLF SHADOW PRICE
caribouw3<- rep(endC, 1000)
ungulatesw3 <- rep(endP, 1000)
wolvesw3 <- seq(from = 1, to = 10000, by = 10)
lfeaturesw3 <- rep(endL, 1000)
W3xyzl <- cbind(caribouw3, ungulatesw3, wolvesw3, lfeaturesw3)
W3xyzl <- as.data.frame(W3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimW3 <- vsim(Caproxc,W3xyzl)
#View(csimW)
shadowwolfw3 <-csimW3[[1]]
shadowwolfw3 <- shadowwolfw3[1:1000,3]
wolf_spw3 <- cbind(wolvesw3, shadowwolfw3)
wolf_spw3 <- as.data.frame(wolf_spw3)
####### Ungulates Shadow Price
caribouu3<- rep(endC, 1000)
ungulatesu3 <- seq(from =1, to = 1500000, by = 1500)
wolvesu3 <- rep(endW, 1000)
lfeaturesu3 <- rep(endL, 1000)
P3xyzl <- cbind(caribouu3, ungulatesu3, wolvesu3, lfeaturesu3)
P3xyzl <- as.data.frame(P3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimP3 <- vsim(Caproxc,P3xyzl)
#View(csimP)
shadowpreyu3 <-csimP3[[1]]
shadowpreyu3 <- shadowpreyu3[1:1000,2]
prey_spu3 <- cbind(ungulatesu3, shadowpreyu3)
prey_spu3 <- as.data.frame(prey_spu3)
#######Linear Features Shadow Price
caribouf3<- rep(endC, 1000)
ungulatesf3 <- rep(endP, 1000)
wolvesf3 <- rep(endW, 1000)
lfeaturesf3 <- seq(from = 1, to = 300000, by = 300)
L3xyzl <- cbind(caribouf3, ungulatesf3, wolvesf3, lfeaturesf3)
L3xyzl <- as.data.frame(L3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimL3 <- vsim(Caproxc,L3xyzl)
#View(csimL)
shadowLFf3 <- csimL3[[1]]
shadowLFf3 <- shadowLFf3[1:1000,4]
LF_spf3 <- cbind(lfeaturesf3, shadowLFf3)
LF_spf3<- as.data.frame(LF_spf3)


####PLOTS
#CARIBOU
par(mfcol = c(1,1))
plot(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1,
     xlab="Number of Caribou",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Caribou",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(0.0, 10000.0),
     ylim = c(0,250000)
)

lines(caribou_spc1$shadowC1 ~ caribou_spc1$caribouc1, lwd =2, lty = 6, col = "light grey")
lines(caribou_spc2$shadowC2 ~ caribou_spc2$caribouc2, lwd =2, lty = 1, col = "dark grey")
lines(caribou_spc3$shadowC3 ~ caribou_spc3$caribouc3, lwd =2, lty = 1, col = "black")
legend("topright", legend = c("0% Restoration", "25% Restoration", "50% Restoration"), 
       col = c("grey", "dark grey", "black"), 
       lty = c(6,1,1), lwd = c(2,2,2), cex = 1)


#WOLVES
plot(wolf_spw2$shadowwolfw2 ~ wolf_spw2$wolvesw2,
     xlab="Number of Wolves",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Wolves",
     cex.main = 1.30,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(0.0, 9000.0),
     ylim = c(-700000,0)
)

lines(wolf_spw1$shadowwolfw1 ~ wolf_spw1$wolvesw1, lwd =2,lty = 6, col = "light grey")
lines(wolf_spw2$shadowwolfw2 ~ wolf_spw2$wolvesw2, lwd =2,lty = 1, col = "dark grey")
lines(wolf_spw3$shadowwolfw3 ~ wolf_spw3$wolvesw3, lwd =2,lty = 1, col = "black")
legend("bottomright", legend = c("0% Restoration", "25% Restoration", "50% Restoration"), 
       col = c("grey", "dark grey", "black"), 
       lty = c(6,1,1), lwd = c(2,2,2), cex = 1)


#UNGULATES
plot(prey_spu1$shadowpreyu1 ~ prey_spu1$ungulatesu1,
     xlab="Number of Prey",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Prey",
     cex.main = 1.30,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(0, 1500000.0),
     ylim = c(-500,500.0)
)

lines(prey_spu1$shadowpreyu1 ~ prey_spu1$ungulatesu1, lwd =2,lty = 6, col = "light grey")
lines(prey_spu2$shadowpreyu2 ~ prey_spu2$ungulatesu2, lwd =2,lty = 1, col = "dark grey")
lines(prey_spu3$shadowpreyu3 ~ prey_spu3$ungulatesu3, lwd =2,lty = 1, col = "black")
legend("topright", legend = c("0% Restoration", "25% Restoration", "50% Restoration"), 
       col = c("grey", "dark grey", "black"), 
       lty = c(6,1,1), lwd = c(2,2,2), cex = 1)


#Linear Features
plot(LF_spf1$shadowLFf1 ~ LF_spf1$lfeaturesf1,
     xlab="Kilometers of Legacy Linear Features",
     ylab="Shadow Price (dollars)",
     main = "Shadow Price of Linear Features",
     cex.main = 1.30,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(100000.0, 300000.0),
     ylim = c(0,50000)
)

lines(LF_spf1$shadowLFf1 ~ LF_spf1$lfeaturesf1, lwd =2,lty = 6, col = "light grey")
lines(LF_spf2$shadowLFf2 ~ LF_spf2$lfeaturesf2, lwd =2,lty = 1, col = "dark grey")
lines(LF_spf3$shadowLFf3 ~ LF_spf3$lfeaturesf3, lwd =2,lty = 1, col = "black")
legend("topright", legend = c("0% Restoration", "25% Restoration", "50% Restoration"), 
       col = c("grey", "dark grey", "black"), 
       lty = c(6,1,1), lwd = c(2,2,2), cex = 1)











 

