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


#############SCENARIO B8, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucB8 <- seq(from = 1, to = 10000, by = 10)
ungulatescB8 <- rep(endP, 1000)
wolvescB8 <- rep(endW, 1000)
lfeaturescB8 <- rep(endL, 1000)
cB8xyzl <- cbind(cariboucB8, ungulatescB8, wolvescB8, lfeaturescB8)
cB8xyzl <- as.data.frame(cB8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcB8 <- vsim(Caproxc,cB8xyzl)
#View(csimC)
shadowtempcB8 <-csimcB8[[1]]
shadowcB8 <- shadowtempcB8[1:1000,1]
caribou_spcB8 <- cbind(cariboucB8, shadowcB8)
caribou_spcB8 <- as.data.frame(caribou_spcB8)


####### WOLF SHADOW PRICE
caribouwB8<- rep(endC, 1000)
ungulateswB8 <- rep(endP, 1000)
wolveswB8 <- seq(from = 1, to = 10000, by = 10)
lfeatureswB8 <- rep(endL, 1000)
wB8xyzl <- cbind(caribouwB8, ungulateswB8, wolveswB8, lfeatureswB8)
wB8xyzl <- as.data.frame(wB8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwB8 <- vsim(Caproxc,wB8xyzl)
#View(csimW)
shadowwolfwB8 <-csimwB8[[1]]
shadowwolfwB8 <- shadowwolfwB8[1:1000,3]
wolf_spwB8 <- cbind(wolveswB8, shadowwolfwB8)
wolf_spwB8 <- as.data.frame(wolf_spwB8)


####### Ungulates Shadow Price
caribouuB8<- rep(endC, 1000)
ungulatesuB8 <- seq(from =1, to = 1500000, by = 1500)
wolvesuB8 <- rep(endW, 1000)
lfeaturesuB8 <- rep(endL, 1000)
uB8xyzl <- cbind(caribouuB8, ungulatesuB8, wolvesuB8, lfeaturesuB8)
uB8xyzl <- as.data.frame(uB8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuB8 <- vsim(Caproxc,uB8xyzl)
#View(csimP)
shadowpreyuB8 <-csimuB8[[1]]
shadowpreyuB8 <- shadowpreyuB8[1:1000,2]
prey_spuB8 <- cbind(ungulatesuB8, shadowpreyuB8)
prey_spuB8 <- as.data.frame(prey_spuB8)


#######Linear Features Shadow Price
cariboufB8<- rep(endC, 1000)
ungulatesfB8 <- rep(endP, 1000)
wolvesfB8 <- rep(endW, 1000)
lfeaturesfB8 <- seq(from = 1, to = 300000, by = 300)
fB8xyzl <- cbind(cariboufB8, ungulatesfB8, wolvesfB8, lfeaturesfB8)
fB8xyzl <- as.data.frame(fB8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfB8 <- vsim(Caproxc,fB8xyzl)
#View(csimL)
shadowLFfB8 <- csimfB8[[1]]
shadowLFfB8 <- shadowLFfB8[1:1000,4]
LF_spfB8 <- cbind(lfeaturesfB8, shadowLFfB8)
LF_spfB8<- as.data.frame(LF_spfB8)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvB8 <- sim.out[70:170,2]
ungulatesvB8 <- sim.out[70:170,3]
wolvesvB8 <- sim.out[70:170,4]
lfeaturesvB8 <-  sim.out[70:170,5] 
wild_timevB8temp <- cbind(caribouvB8, ungulatesvB8, wolvesvB8, lfeaturesvB8)
csim.wildvB8 <- vsim(Caproxc,wild_timevB8temp)
wildspvB8temp <- csim.wildvB8[[1]]
wildspvB8 <- wildspvB8temp[,1:3]
wild_timevB8 <- wild_timevB8temp[,1:3]
wildpsvB8 <- as.data.frame(wildspvB8)
wild_timevB8 <- as.data.frame(wild_timevB8)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvB8$vfun[101]-csim.wildvB8$vfun[1]
sum((wild_timevB8temp[101,]-wild_timevB8temp[1,]) * (wildspvB8temp[101,]+wildspvB8temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevB8 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevB8[j,1]<-timew[j]
  deltavaluevB8[j,2]<- ((wild_timevB8[j+1,1]-wild_timevB8[j,1])*(wildspvB8[j+1,1]+wildspvB8[j,1])/2+ 
                          (wild_timevB8[j+1,2]-wild_timevB8[j,2])*(wildspvB8[j+1,2]+wildspvB8[j,2])/2 +
                          (wild_timevB8[j+1,3]-wild_timevB8[j,3])*(wildspvB8[j+1,3]+wildspvB8[j,3])/2) #- deltavaluevB8[1,2])
  deltavaluevB8[j,3] <- ((wild_timevB8[j+1,1]-wild_timevB8[j,1])*(wildspvB8[j+1,1]+wildspvB8[j,1])/2)# + 8650666.51) #-deltavaluevB8[1,3])
  deltavaluevB8[j,4] <- ((wild_timevB8[j+1,2]-wild_timevB8[j,2])*(wildspvB8[j+1,2]+wildspvB8[j,2])/2)# - 23277.88639) #- deltavaluevB8[1,4])
  deltavaluevB8[j,5] <- ((wild_timevB8[j+1,3]-wild_timevB8[j,3])*(wildspvB8[j+1,3]+wildspvB8[j,3])/2)# + 7074850.9) # - deltavaluevB8[1,5])
}

deltavaluevB8 <- deltavaluevB8[1:100,]
colnames(deltavaluevB8) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevB8 <- as.data.frame(deltavaluevB8)
#View(deltavaluevB8)

#This gives the total change in value normalized to zero
deltavalueTOTvB8 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvB8[j,1]<-timew[j]
  deltavalueTOTvB8[j,2]<-sum(deltavaluevB8[1:j,2])
  deltavalueTOTvB8[j,3]<-sum(deltavaluevB8[1:j,3])
  deltavalueTOTvB8[j,4]<-sum(deltavaluevB8[1:j,4])
  deltavalueTOTvB8[j,5]<-sum(deltavaluevB8[1:j,5])
  
}
colnames(deltavalueTOTvB8) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvB8 <- as.data.frame(deltavalueTOTvB8)
deltavalueTOTvB8 <- rbind(zerostart, deltavalueTOTvB8)
