####################  Value through time 2000 - 2100
#############
#######
####
#
timew <- seq(from = 1, to = 100, by = 1)
zero<-rep(0, 101)

#SCENARIO 1 (WOLF ESCAPEMENT)

cariboutw <- sim.outw[1:101,2]
ungulatestw <- sim.outw[1:101,3]
wolvestw <- sim.outw[1:101,4]
lfeaturestw <-  sim.outw[1:101,5] #rep(sim.out[70,5], 101)    
wild_timevD8temp <- cbind(cariboutw, ungulatestw, wolvestw, lfeaturestw)
csim.wildvD8 <- vsim(Caproxw,wild_timetemp)
wildsptempvD8 <- csim.wildvD8[[1]] 
wildspvD8 <- wildsptempvD8[,1:3]
wild_timevD8 <- wild_timevD8temp[,1:3]
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 101 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild$vfun[101]-csim.wild$vfun[1]
sum((wild_timevD8temp[101,]-wild_timevD8temp[1,]) * (wildsptempvD8[101,]+wildsptempvD8[1,])/2)
#This gives the change in value during a time period 
deltavaluevD8 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevD8[j,1]<-timew[j]
  deltavaluevD8[j,2]<- ((wild_timevD8[j+1,1]-wild_timevD8[j,1])*(wildspvD8[j+1,1]+wildspvD8[j,1])/2+ 
                       (wild_timevD8[j+1,2]-wild_timevD8[j,2])*(wildspvD8[j+1,2]+wildspvD8[j,2])/2 +
                       (wild_timevD8[j+1,3]-wild_timevD8[j,3])*(wildspvD8[j+1,3]+wildspvD8[j,3])/2) #- deltavaluevD82[1,2])
  deltavaluevD8[j,3] <- ((wild_timevD8[j+1,1]-wild_timevD8[j,1])*(wildspvD8[j+1,1]+wildspvD8[j,1])/2)# + 8650666.51) #-deltavaluevD82[1,3])
  deltavaluevD8[j,4] <- ((wild_timevD8[j+1,2]-wild_timevD8[j,2])*(wildspvD8[j+1,2]+wildspvD8[j,2])/2)# - 23277.88639) #- deltavaluevD82[1,4])
  deltavaluevD8[j,5] <- ((wild_timevD8[j+1,3]-wild_timevD8[j,3])*(wildspvD8[j+1,3]+wildspvD8[j,3])/2)# + 7074850.9) # - deltavaluevD82[1,5])
}

deltavaluevD8 <- deltavaluevD8[1:100,]
colnames(deltavaluevD8) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevD8 <- as.data.frame(deltavaluevD8)

#View(deltavaluevD8)

#This gives the total change in valuevD8 normalized to zero
deltavaluevD8TOT <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavaluevD8TOT[j,1]<-timew[j]
  deltavaluevD8TOT[j,2]<-sum(deltavaluevD8[1:j,2])
  deltavaluevD8TOT[j,3]<-sum(deltavaluevD8[1:j,3])
  deltavaluevD8TOT[j,4]<-sum(deltavaluevD8[1:j,4])
  deltavaluevD8TOT[j,5]<-sum(deltavaluevD8[1:j,5])
  
}
colnames(deltavaluevD8TOT) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevD8TOT <- as.data.frame(deltavaluevD8TOT)
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvD8 <- rbind(zerostart, deltavaluevD8TOT)
View(deltavalueTOTvD8)
