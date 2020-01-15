#Prints population levels and amound of linear features

######################################################################################
# {capn} Woodland Caribou
# Dat 4/26/2018
######################################################################################
#install.packages("capn") #only need to run if you have not already installed capn
#install.packages("ggplot2") #only need to run if you have not already installed ggplot
#install.packages("repmis")
library(capn) #https://cran.r-project.org/web/packages/capn/capn.pdf 
library(ggplot2)
library(repmis) #https://cran.r-project.org/web/packages/repmis/index.html 
library(R.oo) #this was somehow not installed as part of repmis and had to be added manually
library(deSolve)

library(rprojroot)

#set working directory
P <- rprojroot::find_rstudio_root_file
source(P("scripts/1a.source_model_wolfceiling.R"), local = FALSE)
#Time Simulation


tseqw <- seq(0,1000,by = 1)
startw <- c(xs = 2300, ys = 1000000.0, zs = 2500, ls = iL)
oderesw <- ode(y = startw, times = tseqw, func = dxdydzdlCC, parms = sim.parmsE)
sim.outw <- as.data.frame(oderesw, row.names = c('time', 'xs', 'ys', 'zs', 'ls'))
sim.outw <- cbind(sim.outw, timeline)
#View(sim.outw)


endCw <- sim.outw[1,2]
endPw <- sim.outw[1,3]
endWw <- sim.outw[1,4]
endLw <- sim.outw[1,5]
endCw
endPw
endWw
endLw
#Dynamics 1980 to 2080
par(mfcol = c(1,1), bty = "o", xaxs = "i", yaxs = "i")
plot(sim.outw$xs ~ sim.outw$time,
     las = 0,
     lwd=2, col="white",
     xlim = c(0,100),
     ylim = c(0.0, 12000.0),
     xlab="Year",
     ylab="Wolf and Caribou Population",
     main = NULL,
     cex.lab = 1.1,
     cex.main = 1.2,
     cex.axis = 1,
     yaxt = "n")
axis(side = 2, at=c(0,2500, 5000, 7500, 10000), labels=c("0", "2,500", "5,000", "7,500", "10,000"))
lines(sim.outw$xs~ sim.outw$time, lwd=2, lty = 1, col="blue")
lines(sim.outw$zs ~ sim.outw$time,lwd=2, lty = 1, col="purple")
legend("topright", legend = c("Caribou", "Wolves", "Ungulates", "Legacy Linear Features"), 
       col = c("blue", "purple", "red", "orange"), 
       lty = c(1,1,6,6), lwd = c(2,2,2,2), cex = 1)

par(new = T)
plot(sim.out$ys ~ sim.outw$timeline, pch=16, axes=F, 
     xlab=NA, ylab=NA, cex=1.2, col = 'white', xlim = c(1980, 2080.0),
     ylim = c(0.0, 1800000.0), xaxt = "n")
axis(side = 4, at=c(0,500000,1000000,1500000), labels=c("0", "500,000", "1,000,000", "1,500,000"))
lines(sim.outw$ys ~ sim.outw$timeline, lwd=2, lty = 6, col="red") 
lines(sim.outw$ls ~ sim.outw$timeline, lwd = 2, lty = 6, col = "orange")
#mtext(side = 4, line = 3, 'Ungulate Population', outer = "true")


