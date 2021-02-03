###########################################################################
#Samantha Maher
#contact at sam.maher@berkeley.edu or maher@ecohealthalliance.org
###########################################################################
#PREPARING CAPN
###########################################################################


#set working directory
P <- rprojroot::find_rstudio_root_file

#additional modeling parameters
dr <- dr #discount rate

#APPROX SPACE parameters
order <- c(6,6,6,6) #approximaton order

#NODES
NumNodes <- 10000  #number of nodes
degn <- c(10,10,10,10)  #nodes for grids


#Boundaries for approx space
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


#Approximate price vector coefficients
aproxSpace <- aproxdef(order, lb, ub, dr)
Caproxc <- vaprox(aproxSpace,caribou_data)  



