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


#############SCENARIO C8, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucC8 <- seq(from = 1, to = 10000, by = 10)
ungulatescC8 <- rep(endP, 1000)
wolvescC8 <- rep(endW, 1000)
lfeaturescC8 <- rep(endL, 1000)
cC8xyzl <- cbind(cariboucC8, ungulatescC8, wolvescC8, lfeaturescC8)
cC8xyzl <- as.data.frame(cC8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcC8 <- vsim(Caproxc,cC8xyzl)
#View(csimC)
shadowtempcC8 <-csimcC8[[1]]
shadowcC8 <- shadowtempcC8[1:1000,1]
caribou_spcC8 <- cbind(cariboucC8, shadowcC8)
caribou_spcC8 <- as.data.frame(caribou_spcC8)


####### WOLF SHADOW PRICE
caribouwC8<- rep(endC, 1000)
ungulateswC8 <- rep(endP, 1000)
wolveswC8 <- seq(from = 1, to = 10000, by = 10)
lfeatureswC8 <- rep(endL, 1000)
wC8xyzl <- cbind(caribouwC8, ungulateswC8, wolveswC8, lfeatureswC8)
wC8xyzl <- as.data.frame(wC8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwC8 <- vsim(Caproxc,wC8xyzl)
#View(csimW)
shadowwolfwC8 <-csimwC8[[1]]
shadowwolfwC8 <- shadowwolfwC8[1:1000,3]
wolf_spwC8 <- cbind(wolveswC8, shadowwolfwC8)
wolf_spwC8 <- as.data.frame(wolf_spwC8)


####### Ungulates Shadow Price
caribouuC8<- rep(endC, 1000)
ungulatesuC8 <- seq(from =1, to = 1500000, by = 1500)
wolvesuC8 <- rep(endW, 1000)
lfeaturesuC8 <- rep(endL, 1000)
uC8xyzl <- cbind(caribouuC8, ungulatesuC8, wolvesuC8, lfeaturesuC8)
uC8xyzl <- as.data.frame(uC8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuC8 <- vsim(Caproxc,uC8xyzl)
#View(csimP)
shadowpreyuC8 <-csimuC8[[1]]
shadowpreyuC8 <- shadowpreyuC8[1:1000,2]
prey_spuC8 <- cbind(ungulatesuC8, shadowpreyuC8)
prey_spuC8 <- as.data.frame(prey_spuC8)


#######Linear Features Shadow Price
cariboufC8<- rep(endC, 1000)
ungulatesfC8 <- rep(endP, 1000)
wolvesfC8 <- rep(endW, 1000)
lfeaturesfC8 <- seq(from = 1, to = 300000, by = 300)
fC8xyzl <- cbind(cariboufC8, ungulatesfC8, wolvesfC8, lfeaturesfC8)
fC8xyzl <- as.data.frame(fC8xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfC8 <- vsim(Caproxc,fC8xyzl)
#View(csimL)
shadowLFfC8 <- csimfC8[[1]]
shadowLFfC8 <- shadowLFfC8[1:1000,4]
LF_spfC8 <- cbind(lfeaturesfC8, shadowLFfC8)
LF_spfC8<- as.data.frame(LF_spfC8)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvC8 <- sim.out[70:170,2]
ungulatesvC8 <- sim.out[70:170,3]
wolvesvC8 <- sim.out[70:170,4]
lfeaturesvC8 <-  sim.out[70:170,5] 
wild_timevC8temp <- cbind(caribouvC8, ungulatesvC8, wolvesvC8, lfeaturesvC8)
csim.wildvC8 <- vsim(Caproxc,wild_timevC8temp)
wildspvC8temp <- csim.wildvC8[[1]]
wildspvC8 <- wildspvC8temp[,1:3]
wild_timevC8 <- wild_timevC8temp[,1:3]
wildpsvC8 <- as.data.frame(wildspvC8)
wild_timevC8 <- as.data.frame(wild_timevC8)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvC8$vfun[101]-csim.wildvC8$vfun[1]
sum((wild_timevC8temp[101,]-wild_timevC8temp[1,]) * (wildspvC8temp[101,]+wildspvC8temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevC8 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevC8[j,1]<-timew[j]
  deltavaluevC8[j,2]<- ((wild_timevC8[j+1,1]-wild_timevC8[j,1])*(wildspvC8[j+1,1]+wildspvC8[j,1])/2+ 
                          (wild_timevC8[j+1,2]-wild_timevC8[j,2])*(wildspvC8[j+1,2]+wildspvC8[j,2])/2 +
                          (wild_timevC8[j+1,3]-wild_timevC8[j,3])*(wildspvC8[j+1,3]+wildspvC8[j,3])/2) #- deltavaluevC8[1,2])
  deltavaluevC8[j,3] <- ((wild_timevC8[j+1,1]-wild_timevC8[j,1])*(wildspvC8[j+1,1]+wildspvC8[j,1])/2)# + 8650666.51) #-deltavaluevC8[1,3])
  deltavaluevC8[j,4] <- ((wild_timevC8[j+1,2]-wild_timevC8[j,2])*(wildspvC8[j+1,2]+wildspvC8[j,2])/2)# - 23277.88639) #- deltavaluevC8[1,4])
  deltavaluevC8[j,5] <- ((wild_timevC8[j+1,3]-wild_timevC8[j,3])*(wildspvC8[j+1,3]+wildspvC8[j,3])/2)# + 7074850.9) # - deltavaluevC8[1,5])
}

deltavaluevC8 <- deltavaluevC8[1:100,]
colnames(deltavaluevC8) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevC8 <- as.data.frame(deltavaluevC8)
#View(deltavaluevC8)

#This gives the total change in value normalized to zero
deltavalueTOTvC8 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvC8[j,1]<-timew[j]
  deltavalueTOTvC8[j,2]<-sum(deltavaluevC8[1:j,2])
  deltavalueTOTvC8[j,3]<-sum(deltavaluevC8[1:j,3])
  deltavalueTOTvC8[j,4]<-sum(deltavaluevC8[1:j,4])
  deltavalueTOTvC8[j,5]<-sum(deltavaluevC8[1:j,5])
  
}
colnames(deltavalueTOTvC8) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvC8 <- as.data.frame(deltavalueTOTvC8)
deltavalueTOTvC8 <- rbind(zerostart, deltavalueTOTvC8)
