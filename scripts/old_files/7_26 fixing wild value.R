#Chang in value stored in wildlife stock through time needs to have the y-axis fixed and lines added to the key

timew <- seq(from = 2010, to = 2110, by = 1)

#SCENARIO 1 (No restoration)

cariboutw <- sim.out[70:170,2]
ungulatestw <- sim.out[70:170,3]
wolvestw <- sim.out[70:170,4]
lfeaturestw <-  sim.out[70:170,5] #rep(sim.out[70,5], 101)    
wild_timetemp <- cbind(cariboutw, ungulatestw, wolvestw, lfeaturestw)
csim.wild <- vsim(Caproxc,wild_timetemp)
wildsptemp <- csim.wild[[1]]
wildsp <- wildsptemp[,1:3]
wild_time <- wild_timetemp[,1:3]
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild$vfun[101]-csim.wild$vfun[1]
sum((wild_timetemp[101,]-wild_timetemp[1,]) * (wildsptemp[101,]+wildsptemp[1,])/2)
#This should give the cumulative loss of wildlife value
sum((wild_time[101,1:3]-wild_time[1,1:3]) * (wildsp[101,1:3]+wildsp[1,1:3])/2)
deltavalue <- matrix(0, nrow = 101, ncol =2)
for(j in 1:100){
  deltavalue[j,1]<-timew[j]
  deltavalue[j,2]<- ((wild_time[j+1,1]-wild_time[j,1])*(wildsp[j+1,1]+wildsp[j,1])/2+ 
                        (wild_time[j+1,2]-wild_time[j,2])*(wildsp[j+1,2]+wildsp[j,2])/2 +
                        (wild_time[j+1,3]-wild_time[j,3])*(wildsp[j+1,3]+wildsp[j,3])/2 -deltavalue[1,2]
  )
}
deltavalue <- deltavalue[2:100,]
colnames(deltavalue) <- c("year","wildlife")
deltavalue <- as.data.frame(deltavalue)



#SCENARIO 2 (25% restoration)
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
#This should give the cumulative loss of wildlife value

#This gives the loss in each time period (one year)
#deltavalue2 <- rowSums((wild_time2[2:101,]-wild_time2[1:100,]) * (wildsp2[2:101,]+wildsp2[1:100,])/2)
#deltavalue2 <- cbind(timew[1:100], deltavalue2)
#colnames(deltavalue2) <- c("year","wildlife")
#deltavalue2 <- as.data.frame(deltavalue2)

deltavalue2 <- matrix(0, nrow = 100, ncol =6)
for(j in 1:100){
  deltavalue2[j,1]<-timew[j]
  deltavalue2[j,2]<- ((wild_time2[j+1,1]-wild_time2[j,1])*(wildsp2[j+1,1]+wildsp2[j,1])/2+ 
    (wild_time2[j+1,2]-wild_time2[j,2])*(wildsp2[j+1,2]+wildsp2[j,2])/2 +
    (wild_time2[j+1,3]-wild_time2[j,3])*(wildsp2[j+1,3]+wildsp2[j,3])/2) #- deltavalue2[1,2])
  deltavalue2[j,3] <- ((wild_time2[j+1,1]-wild_time2[j,1])*(wildsp2[j+1,1]+wildsp2[j,1])/2)# + 8650666.51) #-deltavalue2[1,3])
  deltavalue2[j,4] <- ((wild_time2[j+1,2]-wild_time2[j,2])*(wildsp2[j+1,2]+wildsp2[j,2])/2)# - 23277.88639) #- deltavalue2[1,4])
  deltavalue2[j,5] <- ((wild_time2[j+1,3]-wild_time2[j,3])*(wildsp2[j+1,3]+wildsp2[j,3])/2)# + 7074850.9) # - deltavalue2[1,5])
  deltavalue2[j,6]<- 0
}
#deltavalue2[,3] <- deltavalue2[,3]-deltavalue2[1,3]
#deltavalue[,3]<-deltavalue2[,3]+deltavalue[,3]

deltavalue2 <- deltavalue2[1:100,]
colnames(deltavalue2) <- c("year","wildlife","caribou","ungulates", "wolves", "total value")
deltavalue2 <- as.data.frame(deltavalue2)
View(deltavalue2)

deltavalueTEST <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTEST[j,1]<-timew[j]
  deltavalueTEST[j,2]<-sum(deltavalue2[2:j,2])
  deltavalueTEST[j,3]<-sum(deltavalue2[2:j,3])
  deltavalueTEST[j,4]<-sum(deltavalue2[2:j,4])
  deltavalueTEST[j,5]<-sum(deltavalue2[2:j,5])

}
colnames(deltavalueTEST) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavalueTEST <- as.data.frame(deltavalueTEST)
View(deltavalueTEST)
#plot(wildsp2$acc.price1 ~ wild_time2$cariboutw2)



#SCENARIO 3 (Best Case Scenario, 50%)

cariboutw3 <- sim.out[70:170,2]
ungulatestw3 <- sim.out[70:170,3]
wolvestw3 <- sim.out[70:170,4]
lfeaturestw3 <-  sim.out[70:170,5] #rep(sim.out[70,5], 101)    
wild_time3temp <- cbind(cariboutw3, ungulatestw3, wolvestw3, lfeaturestw3)
csim.wild3 <- vsim(Caproxc,wild_time3temp)
wildsp3temp <- csim.wild3[[1]]
wildsp3 <- wildsp3temp[,1:3]
wild_time3 <- wild_time3temp[,1:3]
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wild3$vfun[101]-csim.wild3$vfun[1]
sum((wild_time3temp[101,]-wild_time3temp[1,]) * (wildsp3temp[101,]+wildsp3temp[1,])/2)
#This should give the cumulative loss of wildlife value
sum((wild_time3[101,1:3]-wild_time3[1,1:3]) * (wildsp3[101,1:3]+wildsp3[1,1:3])/2)
deltavalue3 <- matrix(0, nrow = 101, ncol =2)
for(j in 1:100){
  deltavalue3[j,1]<-timew[j]
  deltavalue3[j,2]<- ((wild_time3[j+1,1]-wild_time3[j,1])*(wildsp3[j+1,1]+wildsp3[j,1])/2+ 
                       (wild_time3[j+1,2]-wild_time3[j,2])*(wildsp3[j+1,2]+wildsp3[j,2])/2 +
                       (wild_time3[j+1,3]-wild_time3[j,3])*(wildsp3[j+1,3]+wildsp3[j,3])/2 -deltavalue3[1,2]
  )
}
deltavalue3 <- deltavalue3[1:100,]
colnames(deltavalue3) <- c("year","wildlife")
deltavalue3 <- as.data.frame(deltavalue3)



par(mfcol = c(1,1))
plot(deltavalue2$wildlife ~ deltavalue2$year,
     xlab="Year",
     ylab="Change in Value Stored in Wildlife Stock",
     main = "Change in Value Stored in Wildlife Stock Through Time",
     cex.main = 1.25,
     cex.lab = 1.1,
     cex = .05,
     col = "white",
     xlim = c(2010, 2110),
     ylim = c(-500000000, 0),
     yaxt = "n"
)
axis(side = 2, at=c(0, 5000000, 10000000, 15000000, 20000000), 
     labels=c("0","5,000,000", "10,000,000", "15,000,000", "20,000,000"))
lines(deltavalue$wildlife ~ deltavalue$year, col = "light blue", lwd =2)
lines(deltavalueTEST$caribou ~deltavalue2$year, col = "red", lwd =2)
lines(deltavalueTEST$ungulates ~deltavalue2$year, col = "orange", lwd =2)
lines(deltavalueTEST$wolves ~deltavalue2$year, col = "purple", lwd =2)
lines(deltavalueTEST$wildlife ~ deltavalue2$year, col = "royal blue", lwd =2) 
lines(deltavalue3$wildlife ~ deltavalue3$year, col = "dark blue", lwd =2)
legend("bottomright", legend = c("No Restoration", "25% Restoration", "50% Restoration"), 
       col = c("light blue", "royal blue", "navy blue"), 
       lty = c(1,1,1), lwd = c(2,2,2), cex = 1)
