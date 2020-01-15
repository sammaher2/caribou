####################  Value through time 2000 - 2100
#############
#######
####
#
timew <- seq(from = 1, to = 100, by = 1)
zero<-rep(0, 101)

#SCENARIO 1 (WOLF ESCAPEMENT)

cariboutw <- sim.outw[1:100,2]
ungulatestw <- sim.outw[1:100,3]
wolvestw <- sim.outw[1:100,4]
lfeaturestw <-  sim.outw[1:100,5] #rep(sim.out[70,5], 101)    
wild_timetemp <- cbind(cariboutw, ungulatestw, wolvestw, lfeaturestw)
csim.wild <- vsim(Caproxc,wild_timetemp)
wildsptemp <- csim.wild[[1]] 
wildsp <- wildsptemp[,1:3]
wild_time <- wild_timetemp[,1:3]
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild$vfun[100]-csim.wild$vfun[1]
sum((wild_timetemp[100,]-wild_timetemp[1,]) * (wildsptemp[100,]+wildsptemp[1,])/2)
#This gives the change in value during a time period 
deltavalue <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavalue[j,1]<-timew[j]
  deltavalue[j,2]<- ((wild_time[j+1,1]-wild_time[j,1])*(wildsp[j+1,1]+wildsp[j,1])/2+ 
                       (wild_time[j+1,2]-wild_time[j,2])*(wildsp[j+1,2]+wildsp[j,2])/2 +
                       (wild_time[j+1,3]-wild_time[j,3])*(wildsp[j+1,3]+wildsp[j,3])/2) #- deltavalue2[1,2])
  deltavalue[j,3] <- ((wild_time[j+1,1]-wild_time[j,1])*(wildsp[j+1,1]+wildsp[j,1])/2)# + 8650666.51) #-deltavalue2[1,3])
  deltavalue[j,4] <- ((wild_time[j+1,2]-wild_time[j,2])*(wildsp[j+1,2]+wildsp[j,2])/2)# - 23277.88639) #- deltavalue2[1,4])
  deltavalue[j,5] <- ((wild_time[j+1,3]-wild_time[j,3])*(wildsp[j+1,3]+wildsp[j,3])/2)# + 7074850.9) # - deltavalue2[1,5])
}

deltavalue <- deltavalue[1:100,]
colnames(deltavalue) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalue <- as.data.frame(deltavalue)

#View(deltavalue)

#This gives the total change in value normalized to zero
deltavalueTOT <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOT[j,1]<-timew[j]
  deltavalueTOT[j,2]<-sum(deltavalue[1:j,2])
  deltavalueTOT[j,3]<-sum(deltavalue[1:j,3])
  deltavalueTOT[j,4]<-sum(deltavalue[1:j,4])
  deltavalueTOT[j,5]<-sum(deltavalue[1:j,5])
  
}
colnames(deltavalueTOT) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalueTOT <- as.data.frame(deltavalueTOT)
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvD8 <- rbind(zerostart, deltavalueTOT)
View(deltavalueTOTvD8)