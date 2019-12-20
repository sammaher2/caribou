###########################################################################
#Samantha Maher
#Yale School of Forestry and Environmental Studies 2018
#contact at sammaher2@comcast.net or maher@ecohealthalliance.org
###########################################################################
#Caribou/wolf/ungulate/linear features dynamics systems model
#This is the mode that simulates and plots the natural stock level over the next 1000 years
#It uses the 1.source_model.R file as the the source for all values and functions
###########################################################################


#install.packages("capn") #only need to run if you have not already installed capn
#install.packages("ggplot2") #only need to run if you have not already installed ggplot
#install.packages("repmis")
library(capn) #https://cran.r-project.org/web/packages/capn/capn.pdf 
library(ggplot2)
library(repmis) #https://cran.r-project.org/web/packages/repmis/index.html 
library(R.oo) #this was somehow not installed as part of repmis and had to be added manually
library(deSolve)
library(rprojroot)

#rm(list=ls())

#set working directory
P <- rprojroot::find_rstudio_root_file
#setwd("C:\\Users\\Cameron\\Documents\\Sam's Stuff\\MESc and Research Methods\\Wolf Caribou project\\R files capn\\Economic program")

#load economic and ecological program with parameters (they reference each other)
#source("5_1_sourceNOrestore.R", local = FALSE)
source(P("scripts/1.source_model.R"), local = FALSE)


#Time Simulation
tseq <- seq(0,1000,by = 1)
start2 <- c(xs = 2300, ys = 10000.0, zs = 800, ls = iL) #starting values or caribou, ungulares, wolves, and linear features in that order
oderes <- ode(y = start2, times = tseq, func = dxdydzdlCC, parms = sim.parmsE)
sim.out <- as.data.frame(oderes, row.names = c('time', 'xs', 'ys', 'zs', 'ls'))
timeline <- seq(from = 1931, to = 2931, by= 1)
sim.out <- cbind(sim.out, timeline)
#View(sim.out)


#Populations in 2017 (used to simulate current dynamics for capn)
endC <- sim.out[79,2]
endP <- sim.out[79,3]
endW <- sim.out[79,4]
endL <- sim.out[79,5]
endC
endP
endW

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