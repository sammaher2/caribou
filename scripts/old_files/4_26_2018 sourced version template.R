#Can remove this file because it is just a template for 1.source_model.R
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

#rm(list=ls())

#set working directory
P <- rprojroot::find_rstudio_root_file
#setwd("C:\\Users\\Cameron\\Documents\\Sam's Stuff\\MESc and Research Methods\\Wolf Caribou project\\R files capn\\Economic program")

#load economic and ecological program with parameters (they reference each other)
#source("5_1_sourceNOrestore.R", local = FALSE)
source(P("scripts/4_26_sourcemodel.R"), local = FALSE)
#Time Simulation


tseq <- seq(0,1000,by = 1)
start2 <- c(xs = 2300, ys = 10000.0, zs = 800, ls = iL)
oderes <- ode(y = start2, times = tseq, func = dxdydzdlCC, parms = sim.parmsE)
sim.out <- as.data.frame(oderes, row.names = c('time', 'xs', 'ys', 'zs', 'ls'))
timeline <- seq(from = 1931, to = 2931, by= 1)
sim.out <- cbind(sim.out, timeline)
#View(sim.out)



endC <- sim.out[79,2]
endP <- sim.out[79,3]
endW <- sim.out[79,4]
endL <- sim.out[79,5]
endC
endP
endW
endL

###PREPARING CAPN

#additional modeling parameters
dr <- 0.04 #discount rate

#APPROX SPACE parameters (should be bigger than nodes)
order <- c(6,6,6,6) #approximaton order
#ub1 <- c(20000, 2000000,10000,800000) 
#lb1 <- c(1, 1, 1, 1)  # lower bounds

#NODES
NumNodes <- 10000  #number of nodes
degn <- c(10,10,10,10)  #nodes for grids
#ub <- c(do*.2, do*20, do*.0450000) 
#lb <- c(10, 500000, 600, 50000)  # lower bounds

#Experimental Bounds
#Narrow Bounds:
#lb <- c(50, 10000, 100, 10000)
#ub <-  c(8500, 1350000, 300000)

#Medium Bounds: 
#lb1 <- c(5000, 8000, 10, 10)
#ub1 <-  c(10000, 1500000, 6000, 400000)

#Wide Bounds: 
lb <- c(1,1,1,1)
ub <-  c(20000, 2000000, 10000, 800000)


cgrids <- chebgrids(degn,lb,ub,rtype='grid') # Chevyshev nodes
xs <- cgrids[,1]      
ys <- cgrids[,2]       
zs <- cgrids[,3] 
ls <- cgrids[,4] 

###POLYNOMIAL SHOLD BE BROADER THAN THE NODES

caribou_data <- matrix(0,nrow = NumNodes, ncol = 9)
#simulate at nodes
for(j in 1:NumNodes){
  caribou_data[j,1]<-xs[j]
  caribou_data[j,2]<-ys[j]
  caribou_data[j,3]<-zs[j]
  caribou_data[j,4]<-ls[j]
  caribou_data[j,5]<-xdot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
  caribou_data[j,6]<-ydot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
  caribou_data[j,7]<-zdot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
  caribou_data[j,8]<-ldot(xs[j], ys[j], zs[j], ls[j], sim.parmsE)
  caribou_data[j,9]<-wval(xs[j], ys[j], zs[j], ls[j], sim.parmsW)
}
#View(caribou_data)

#
aproxspace <- aproxdef(order, lb, ub, dr)
Caproxc <- vaprox(aproxspace,caribou_data)  ###This is where I am confused. What is my equivalent of lvaproxdata
#Csim <- vsim(Caproxc, sim.out[,2:5])



