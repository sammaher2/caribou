#Thows error: 'sim.outw' not found


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
deltavalueTOT <- rbind(zerostart, deltavalueTOT)
View(deltavalueTOT)


###SCENARIO 2 (25% restoration)
##############################
cariboutw2 <- sim.out[70:170,2]
ungulatestw2 <- sim.out[70:170,3]
wolvestw2 <- sim.out[70:170,4]
lfeaturestw2 <-  sim.out[70:170,5] #rep(sim.out[70,5], 101)    
wild_time2temp <- cbind(cariboutw2, ungulatestw2, wolvestw2, lfeaturestw2)
csim.wild2 <- vsim(Caproxc,wild_time2temp)
wildsp2temp <- csim.wild2[[1]]
wildsp2 <- wildsp2temp[,1:3]
wild_time2 <- wild_time2temp[,1:3]
wildps2 <- as.data.frame(wildsp2)
wild_time2 <- as.data.frame(wild_time2)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild2$vfun[101]-csim.wild2$vfun[1]
sum((wild_time2temp[101,]-wild_time2temp[1,]) * (wildsp2temp[101,]+wildsp2temp[1,])/2)

#This gives the change in value during a time period 
deltavalue2 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavalue2[j,1]<-timew[j]
  deltavalue2[j,2]<- ((wild_time2[j+1,1]-wild_time2[j,1])*(wildsp2[j+1,1]+wildsp2[j,1])/2+ 
                        (wild_time2[j+1,2]-wild_time2[j,2])*(wildsp2[j+1,2]+wildsp2[j,2])/2 +
                        (wild_time2[j+1,3]-wild_time2[j,3])*(wildsp2[j+1,3]+wildsp2[j,3])/2) #- deltavalue2[1,2])
  deltavalue2[j,3] <- ((wild_time2[j+1,1]-wild_time2[j,1])*(wildsp2[j+1,1]+wildsp2[j,1])/2)# + 8650666.51) #-deltavalue2[1,3])
  deltavalue2[j,4] <- ((wild_time2[j+1,2]-wild_time2[j,2])*(wildsp2[j+1,2]+wildsp2[j,2])/2)# - 23277.88639) #- deltavalue2[1,4])
  deltavalue2[j,5] <- ((wild_time2[j+1,3]-wild_time2[j,3])*(wildsp2[j+1,3]+wildsp2[j,3])/2)# + 7074850.9) # - deltavalue2[1,5])
}

deltavalue2 <- deltavalue2[1:100,]
colnames(deltavalue2) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalue2 <- as.data.frame(deltavalue2)
#View(deltavalue2)

#This gives the total change in value normalized to zero
deltavalueTOT2 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOT2[j,1]<-timew[j]
  deltavalueTOT2[j,2]<-sum(deltavalue2[1:j,2])
  deltavalueTOT2[j,3]<-sum(deltavalue2[1:j,3])
  deltavalueTOT2[j,4]<-sum(deltavalue2[1:j,4])
  deltavalueTOT2[j,5]<-sum(deltavalue2[1:j,5])
  
}
colnames(deltavalueTOT2) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOT2 <- as.data.frame(deltavalueTOT2)
deltavalueTOT2 <- rbind(zerostart, deltavalueTOT2)
#View(deltavalueTOT2)
 


###SCENARIO 3 (BEST CASE SCENARIO)
##############################
cariboutw3 <- sim.out[70:170,2]
ungulatestw3 <- sim.out[70:170,3]
wolvestw3 <- sim.out[70:170,4]
lfeaturestw3 <-  sim.out[70:170,5] #rep(sim.out[70,5], 101)    
wild_time3temp <- cbind(cariboutw3, ungulatestw3, wolvestw3, lfeaturestw3)
csim.wild3 <- vsim(Caproxc,wild_time3temp)
wildsp3temp <- csim.wild3[[1]]
wildsp3 <- wildsp3temp[,1:3]
wild_time3 <- wild_time3temp[,1:3]
wildps3 <- as.data.frame(wildsp3)
wild_time3 <- as.data.frame(wild_time3)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild3$vfun[101]-csim.wild3$vfun[1]
sum((wild_time3temp[101,]-wild_time3temp[1,]) * (wildsp3temp[101,]+wildsp3temp[1,])/2)

#This gives the change in value during a time period 
deltavalue3 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavalue3[j,1]<-timew[j]
  deltavalue3[j,2]<- ((wild_time3[j+1,1]-wild_time3[j,1])*(wildsp3[j+1,1]+wildsp3[j,1])/2+ 
                        (wild_time3[j+1,2]-wild_time3[j,2])*(wildsp3[j+1,2]+wildsp3[j,2])/2 +
                        (wild_time3[j+1,3]-wild_time3[j,3])*(wildsp3[j+1,3]+wildsp3[j,3])/2) #- deltavalue2[1,2])
  deltavalue3[j,3] <- ((wild_time3[j+1,1]-wild_time3[j,1])*(wildsp3[j+1,1]+wildsp3[j,1])/2)# + 8650666.51) #-deltavalue2[1,3])
  deltavalue3[j,4] <- ((wild_time3[j+1,2]-wild_time3[j,2])*(wildsp3[j+1,2]+wildsp3[j,2])/2)# - 23277.88639) #- deltavalue2[1,4])
  deltavalue3[j,5] <- ((wild_time3[j+1,3]-wild_time3[j,3])*(wildsp3[j+1,3]+wildsp3[j,3])/2)# + 7074850.9) # - deltavalue2[1,5])
}

deltavalue3 <- deltavalue3[1:100,]
colnames(deltavalue3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalue3 <- as.data.frame(deltavalue3)

#This gives the total change in value normalized to zero
deltavalueTOT3 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOT3[j,1]<-timew[j]
  deltavalueTOT3[j,2]<-sum(deltavalue3[1:j,2])
  deltavalueTOT3[j,3]<-sum(deltavalue3[1:j,3])
  deltavalueTOT3[j,4]<-sum(deltavalue3[1:j,4])
  deltavalueTOT3[j,5]<-sum(deltavalue3[1:j,5])
  
}
colnames(deltavalueTOT3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalueTOT3 <- as.data.frame(deltavalueTOT3)
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOT3 <- as.data.frame(deltavalueTOT3)
deltavalueTOT3 <- rbind(zerostart, deltavalueTOT3)
