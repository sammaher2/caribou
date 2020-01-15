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


#############SCENARIO A8, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucA8 <- seq(from = 1, to = 10000, by = 10)
ungulatescA8 <- rep(endP, 1000)
wolvescA8 <- rep(endW, 1000)
lfeaturescA8 <- rep(endL, 1000)
cA8xyzl <- cbind(cariboucA8, ungulatescA8, wolvescA8, lfeaturescA8)
cA8xyzl <- as.data.frame(cA8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcA8 <- vsim(Caproxc,cA8xyzl)
#View(csimC)
shadowtempcA8 <-csimcA8[[1]]
shadowcA8 <- shadowtempcA8[1:1000,1]
caribou_spcA8 <- cbind(cariboucA8, shadowcA8)
caribou_spcA8 <- as.data.frame(caribou_spcA8)


####### WOLF SHADOW PRICE
caribouwA8<- rep(endC, 1000)
ungulateswA8 <- rep(endP, 1000)
wolveswA8 <- seq(from = 1, to = 10000, by = 10)
lfeatureswA8 <- rep(endL, 1000)
wA8xyzl <- cbind(caribouwA8, ungulateswA8, wolveswA8, lfeatureswA8)
wA8xyzl <- as.data.frame(wA8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwA8 <- vsim(Caproxc,wA8xyzl)
#View(csimW)
shadowwolfwA8 <-csimwA8[[1]]
shadowwolfwA8 <- shadowwolfwA8[1:1000,3]
wolf_spwA8 <- cbind(wolveswA8, shadowwolfwA8)
wolf_spwA8 <- as.data.frame(wolf_spwA8)


####### Ungulates Shadow Price
caribouuA8<- rep(endC, 1000)
ungulatesuA8 <- seq(from =1, to = 1500000, by = 1500)
wolvesuA8 <- rep(endW, 1000)
lfeaturesuA8 <- rep(endL, 1000)
uA8xyzl <- cbind(caribouuA8, ungulatesuA8, wolvesuA8, lfeaturesuA8)
uA8xyzl <- as.data.frame(uA8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuA8 <- vsim(Caproxc,uA8xyzl)
#View(csimP)
shadowpreyuA8 <-csimuA8[[1]]
shadowpreyuA8 <- shadowpreyuA8[1:1000,2]
prey_spuA8 <- cbind(ungulatesuA8, shadowpreyuA8)
prey_spuA8 <- as.data.frame(prey_spuA8)


#######Linear Features Shadow Price
cariboufA8<- rep(endC, 1000)
ungulatesfA8 <- rep(endP, 1000)
wolvesfA8 <- rep(endW, 1000)
lfeaturesfA8 <- seq(from = 1, to = 300000, by = 300)
fA8xyzl <- cbind(cariboufA8, ungulatesfA8, wolvesfA8, lfeaturesfA8)
fA8xyzl <- as.data.frame(fA8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfA8 <- vsim(Caproxc,fA8xyzl)
#View(csimL)
shadowLFfA8 <- csimfA8[[1]]
shadowLFfA8 <- shadowLFfA8[1:1000,4]
LF_spfA8 <- cbind(lfeaturesfA8, shadowLFfA8)
LF_spfA8<- as.data.frame(LF_spfA8)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvA8 <- sim.out[70:170,2]
ungulatesvA8 <- sim.out[70:170,3]
wolvesvA8 <- sim.out[70:170,4]
lfeaturesvA8 <-  sim.out[70:170,5] 
wild_timevA8temp <- cbind(caribouvA8, ungulatesvA8, wolvesvA8, lfeaturesvA8)
csim.wildvA8 <- vsim(Caproxc,wild_timevA8temp)
wildspvA8temp <- csim.wildvA8[[1]]
wildspvA8 <- wildspvA8temp[,1:3]
wild_timevA8 <- wild_timevA8temp[,1:3]
wildpsvA8 <- as.data.frame(wildspvA8)
wild_timevA8 <- as.data.frame(wild_timevA8)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvA8$vfun[101]-csim.wildvA8$vfun[1]
sum((wild_timevA8temp[101,]-wild_timevA8temp[1,]) * (wildspvA8temp[101,]+wildspvA8temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevA8 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevA8[j,1]<-timew[j]
  deltavaluevA8[j,2]<- ((wild_timevA8[j+1,1]-wild_timevA8[j,1])*(wildspvA8[j+1,1]+wildspvA8[j,1])/2+ 
                          (wild_timevA8[j+1,2]-wild_timevA8[j,2])*(wildspvA8[j+1,2]+wildspvA8[j,2])/2 +
                          (wild_timevA8[j+1,3]-wild_timevA8[j,3])*(wildspvA8[j+1,3]+wildspvA8[j,3])/2) #- deltavaluevA8[1,2])
  deltavaluevA8[j,3] <- ((wild_timevA8[j+1,1]-wild_timevA8[j,1])*(wildspvA8[j+1,1]+wildspvA8[j,1])/2)# + 8650666.51) #-deltavaluevA8[1,3])
  deltavaluevA8[j,4] <- ((wild_timevA8[j+1,2]-wild_timevA8[j,2])*(wildspvA8[j+1,2]+wildspvA8[j,2])/2)# - 23277.88639) #- deltavaluevA8[1,4])
  deltavaluevA8[j,5] <- ((wild_timevA8[j+1,3]-wild_timevA8[j,3])*(wildspvA8[j+1,3]+wildspvA8[j,3])/2)# + 7074850.9) # - deltavaluevA8[1,5])
}

deltavaluevA8 <- deltavaluevA8[1:100,]
colnames(deltavaluevA8) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevA8 <- as.data.frame(deltavaluevA8)
#View(deltavaluevA8)

#This gives the total change in value normalized to zero
deltavalueTOTvA8 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvA8[j,1]<-timew[j]
  deltavalueTOTvA8[j,2]<-sum(deltavaluevA8[1:j,2])
  deltavalueTOTvA8[j,3]<-sum(deltavaluevA8[1:j,3])
  deltavalueTOTvA8[j,4]<-sum(deltavaluevA8[1:j,4])
  deltavalueTOTvA8[j,5]<-sum(deltavaluevA8[1:j,5])
  
}
colnames(deltavalueTOTvA8) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvA8 <- as.data.frame(deltavalueTOTvA8)
deltavalueTOTvA8 <- rbind(zerostart, deltavalueTOTvA8)
