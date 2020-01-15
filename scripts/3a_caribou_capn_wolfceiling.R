###########################################################################
#Samantha Maher
#Yale School of Forestry and Environmental Studies 2018
#contact at sammaher2@comcast.net or maher@ecohealthalliance.org
###########################################################################
#PREPARING CAPN
###########################################################################

#RUN SCRIPT 2 WHICH IN TURN RUNS SCRIPT ONE (JUST SO YOU ONLY HAVE TO DO IT ONCE)
#set working directory
P <- rprojroot::find_rstudio_root_file

#USE this one for restoration scenarios
#source(P("scripts/2.caribou_dynamics.R"), local = FALSE)  

#USE this one for wolfscenarios
source(P("scripts/2a.caribou_dynamics_wolfceiling.R"), local = FALSE)
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
Caproxw <- vaprox(aproxspace,caribou_data)  ###This is where I am confused. What is my equivalent of lvaproxdata
#Csim <- vsim(Caproxc, sim.out[,2:5])