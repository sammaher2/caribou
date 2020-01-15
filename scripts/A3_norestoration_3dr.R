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


#############SCENARIO A3, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucA3 <- seq(from = 1, to = 10000, by = 10)
ungulatescA3 <- rep(endP, 1000)
wolvescA3 <- rep(endW, 1000)
lfeaturescA3 <- rep(endL, 1000)
cA3xyzl <- cbind(cariboucA3, ungulatescA3, wolvescA3, lfeaturescA3)
cA3xyzl <- as.data.frame(cA3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcA3 <- vsim(Caproxc,cA3xyzl)
#View(csimC)
shadowtempcA3 <-csimcA3[[1]]
shadowcA3 <- shadowtempcA3[1:1000,1]
caribou_spcA3 <- cbind(cariboucA3, shadowcA3)
caribou_spcA3 <- as.data.frame(caribou_spcA3)


####### WOLF SHADOW PRICE
caribouwA3<- rep(endC, 1000)
ungulateswA3 <- rep(endP, 1000)
wolveswA3 <- seq(from = 1, to = 10000, by = 10)
lfeatureswA3 <- rep(endL, 1000)
wA3xyzl <- cbind(caribouwA3, ungulateswA3, wolveswA3, lfeatureswA3)
wA3xyzl <- as.data.frame(wA3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwA3 <- vsim(Caproxc,wA3xyzl)
#View(csimW)
shadowwolfwA3 <-csimwA3[[1]]
shadowwolfwA3 <- shadowwolfwA3[1:1000,3]
wolf_spwA3 <- cbind(wolveswA3, shadowwolfwA3)
wolf_spwA3 <- as.data.frame(wolf_spwA3)


####### Ungulates Shadow Price
caribouuA3<- rep(endC, 1000)
ungulatesuA3 <- seq(from =1, to = 1500000, by = 1500)
wolvesuA3 <- rep(endW, 1000)
lfeaturesuA3 <- rep(endL, 1000)
uA3xyzl <- cbind(caribouuA3, ungulatesuA3, wolvesuA3, lfeaturesuA3)
uA3xyzl <- as.data.frame(uA3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuA3 <- vsim(Caproxc,uA3xyzl)
#View(csimP)
shadowpreyuA3 <-csimuA3[[1]]
shadowpreyuA3 <- shadowpreyuA3[1:1000,2]
prey_spuA3 <- cbind(ungulatesuA3, shadowpreyuA3)
prey_spuA3 <- as.data.frame(prey_spuA3)


#######Linear Features Shadow Price
cariboufA3<- rep(endC, 1000)
ungulatesfA3 <- rep(endP, 1000)
wolvesfA3 <- rep(endW, 1000)
lfeaturesfA3 <- seq(from = 1, to = 300000, by = 300)
fA3xyzl <- cbind(cariboufA3, ungulatesfA3, wolvesfA3, lfeaturesfA3)
fA3xyzl <- as.data.frame(fA3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfA3 <- vsim(Caproxc,fA3xyzl)
#View(csimL)
shadowLFfA3 <- csimfA3[[1]]
shadowLFfA3 <- shadowLFfA3[1:1000,4]
LF_spfA3 <- cbind(lfeaturesfA3, shadowLFfA3)
LF_spfA3<- as.data.frame(LF_spfA3)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvA3 <- sim.out[70:170,2]
ungulatesvA3 <- sim.out[70:170,3]
wolvesvA3 <- sim.out[70:170,4]
lfeaturesvA3 <-  sim.out[70:170,5] 
wild_timevA3temp <- cbind(caribouvA3, ungulatesvA3, wolvesvA3, lfeaturesvA3)
csim.wildvA3 <- vsim(Caproxc,wild_timevA3temp)
wildspvA3temp <- csim.wildvA3[[1]]
wildspvA3 <- wildspvA3temp[,1:3]
wild_timevA3 <- wild_timevA3temp[,1:3]
wildpsvA3 <- as.data.frame(wildspvA3)
wild_timevA3 <- as.data.frame(wild_timevA3)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvA3$vfun[101]-csim.wildvA3$vfun[1]
sum((wild_timevA3temp[101,]-wild_timevA3temp[1,]) * (wildspvA3temp[101,]+wildspvA3temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevA3 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevA3[j,1]<-timew[j]
  deltavaluevA3[j,2]<- ((wild_timevA3[j+1,1]-wild_timevA3[j,1])*(wildspvA3[j+1,1]+wildspvA3[j,1])/2+ 
                        (wild_timevA3[j+1,2]-wild_timevA3[j,2])*(wildspvA3[j+1,2]+wildspvA3[j,2])/2 +
                        (wild_timevA3[j+1,3]-wild_timevA3[j,3])*(wildspvA3[j+1,3]+wildspvA3[j,3])/2) #- deltavaluevA3[1,2])
  deltavaluevA3[j,3] <- ((wild_timevA3[j+1,1]-wild_timevA3[j,1])*(wildspvA3[j+1,1]+wildspvA3[j,1])/2)# + 8650666.51) #-deltavaluevA3[1,3])
  deltavaluevA3[j,4] <- ((wild_timevA3[j+1,2]-wild_timevA3[j,2])*(wildspvA3[j+1,2]+wildspvA3[j,2])/2)# - 23277.88639) #- deltavaluevA3[1,4])
  deltavaluevA3[j,5] <- ((wild_timevA3[j+1,3]-wild_timevA3[j,3])*(wildspvA3[j+1,3]+wildspvA3[j,3])/2)# + 7074850.9) # - deltavaluevA3[1,5])
}

deltavaluevA3 <- deltavaluevA3[1:100,]
colnames(deltavaluevA3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevA3 <- as.data.frame(deltavaluevA3)
#View(deltavaluevA3)

#This gives the total change in value normalized to zero
deltavalueTOTvA3 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvA3[j,1]<-timew[j]
  deltavalueTOTvA3[j,2]<-sum(deltavaluevA3[1:j,2])
  deltavalueTOTvA3[j,3]<-sum(deltavaluevA3[1:j,3])
  deltavalueTOTvA3[j,4]<-sum(deltavaluevA3[1:j,4])
  deltavalueTOTvA3[j,5]<-sum(deltavaluevA3[1:j,5])
  
}
colnames(deltavalueTOTvA3) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvA3 <- as.data.frame(deltavalueTOTvA3)
deltavalueTOTvA3 <- rbind(zerostart, deltavalueTOTvA3)
