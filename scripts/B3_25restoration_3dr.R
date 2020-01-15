#All the lines in each plot lay on top of one another. 
####################Sam's response to that:
#There are three chunks of code, one for each of the 3 scenarios. 
#Everytime you run one of the chunks of code, you need to rerun scripts 1,2,and 3, and make the changes in script 1 (the source model) 
#so that it is a different scenario being modelled. Otherwise, the lines will just plot over each other.
#For 0% restoration, 25% restoration, and 50% restoration scenarios, all you have to do is change the value in Line 13 of file "1.source_model"
#Then run scripts 1, 2, and 3 with that new value (and then the chunk of code for that simulation in this script)
#Don't run this entire script because you'll replace the values from the previous scenario, causing the lines to all plot over each other
#Sorry, it's not the most elegant coding- please feel free to make this a bit more intuitive!

####Code for simulating price curves for each stock on same graph
zero <- rep (0,1500000)


#############SCENARIO B3, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucB3 <- seq(from = 1, to = 10000, by = 10)
ungulatescB3 <- rep(endP, 1000)
wolvescB3 <- rep(endW, 1000)
lfeaturescB3 <- rep(endL, 1000)
cB3xyzl <- cbind(cariboucB3, ungulatescB3, wolvescB3, lfeaturescB3)
cB3xyzl <- as.data.frame(cB3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcB3 <- vsim(Caproxc,cB3xyzl)
#View(csimC)
shadowtempcB3 <-csimcB3[[1]]
shadowcB3 <- shadowtempcB3[1:1000,1]
caribou_spcB3 <- cbind(cariboucB3, shadowcB3)
caribou_spcB3 <- as.data.frame(caribou_spcB3)


####### WOLF SHADOW PRICE
caribouwB3<- rep(endC, 1000)
ungulateswB3 <- rep(endP, 1000)
wolveswB3 <- seq(from = 1, to = 10000, by = 10)
lfeatureswB3 <- rep(endL, 1000)
wB3xyzl <- cbind(caribouwB3, ungulateswB3, wolveswB3, lfeatureswB3)
wB3xyzl <- as.data.frame(wB3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwB3 <- vsim(Caproxc,wB3xyzl)
#View(csimW)
shadowwolfwB3 <-csimwB3[[1]]
shadowwolfwB3 <- shadowwolfwB3[1:1000,3]
wolf_spwB3 <- cbind(wolveswB3, shadowwolfwB3)
wolf_spwB3 <- as.data.frame(wolf_spwB3)


####### Ungulates Shadow Price
caribouuB3<- rep(endC, 1000)
ungulatesuB3 <- seq(from =1, to = 1500000, by = 1500)
wolvesuB3 <- rep(endW, 1000)
lfeaturesuB3 <- rep(endL, 1000)
uB3xyzl <- cbind(caribouuB3, ungulatesuB3, wolvesuB3, lfeaturesuB3)
uB3xyzl <- as.data.frame(uB3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuB3 <- vsim(Caproxc,uB3xyzl)
#View(csimP)
shadowpreyuB3 <-csimuB3[[1]]
shadowpreyuB3 <- shadowpreyuB3[1:1000,2]
prey_spuB3 <- cbind(ungulatesuB3, shadowpreyuB3)
prey_spuB3 <- as.data.frame(prey_spuB3)


#######Linear Features Shadow Price
cariboufB3<- rep(endC, 1000)
ungulatesfB3 <- rep(endP, 1000)
wolvesfB3 <- rep(endW, 1000)
lfeaturesfB3 <- seq(from = 1, to = 300000, by = 300)
fB3xyzl <- cbind(cariboufB3, ungulatesfB3, wolvesfB3, lfeaturesfB3)
fB3xyzl <- as.data.frame(fB3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfB3 <- vsim(Caproxc,fB3xyzl)
#View(csimL)
shadowLFfB3 <- csimfB3[[1]]
shadowLFfB3 <- shadowLFfB3[1:1000,4]
LF_spfB3 <- cbind(lfeaturesfB3, shadowLFfB3)
LF_spfB3<- as.data.frame(LF_spfB3)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvB3 <- sim.out[70:170,2]
ungulatesvB3 <- sim.out[70:170,3]
wolvesvB3 <- sim.out[70:170,4]
lfeaturesvB3 <-  sim.out[70:170,5] 
wild_timevB3temp <- cbind(caribouvB3, ungulatesvB3, wolvesvB3, lfeaturesvB3)
csim.wildvB3 <- vsim(Caproxc,wild_timevB3temp)
wildspvB3temp <- csim.wildvB3[[1]]
wildspvB3 <- wildspvB3temp[,1:3]
wild_timevB3 <- wild_timevB3temp[,1:3]
wildpsvB3 <- as.data.frame(wildspvB3)
wild_timevB3 <- as.data.frame(wild_timevB3)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvB3$vfun[101]-csim.wildvB3$vfun[1]
sum((wild_timevB3temp[101,]-wild_timevB3temp[1,]) * (wildspvB3temp[101,]+wildspvB3temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevB3 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevB3[j,1]<-timew[j]
  deltavaluevB3[j,2]<- ((wild_timevB3[j+1,1]-wild_timevB3[j,1])*(wildspvB3[j+1,1]+wildspvB3[j,1])/2+ 
                          (wild_timevB3[j+1,2]-wild_timevB3[j,2])*(wildspvB3[j+1,2]+wildspvB3[j,2])/2 +
                          (wild_timevB3[j+1,3]-wild_timevB3[j,3])*(wildspvB3[j+1,3]+wildspvB3[j,3])/2) #- deltavaluevB3[1,2])
  deltavaluevB3[j,3] <- ((wild_timevB3[j+1,1]-wild_timevB3[j,1])*(wildspvB3[j+1,1]+wildspvB3[j,1])/2)# + 8650666.51) #-deltavaluevB3[1,3])
  deltavaluevB3[j,4] <- ((wild_timevB3[j+1,2]-wild_timevB3[j,2])*(wildspvB3[j+1,2]+wildspvB3[j,2])/2)# - 23277.88639) #- deltavaluevB3[1,4])
  deltavaluevB3[j,5] <- ((wild_timevB3[j+1,3]-wild_timevB3[j,3])*(wildspvB3[j+1,3]+wildspvB3[j,3])/2)# + 7074850.9) # - deltavaluevB3[1,5])
}

deltavaluevB3 <- deltavaluevB3[1:100,]
colnames(deltavaluevB3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevB3 <- as.data.frame(deltavaluevB3)
#View(deltavaluevB3)

#This gives the total change in value normalized to zero
deltavalueTOTvB3 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvB3[j,1]<-timew[j]
  deltavalueTOTvB3[j,2]<-sum(deltavaluevB3[1:j,2])
  deltavalueTOTvB3[j,3]<-sum(deltavaluevB3[1:j,3])
  deltavalueTOTvB3[j,4]<-sum(deltavaluevB3[1:j,4])
  deltavalueTOTvB3[j,5]<-sum(deltavaluevB3[1:j,5])
  
}
colnames(deltavalueTOTvB3) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvB3 <- as.data.frame(deltavalueTOTvB3)
deltavalueTOTvB3 <- rbind(zerostart, deltavalueTOTvB3)
