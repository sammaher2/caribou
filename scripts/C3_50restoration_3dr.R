#All the lines in each plot lay on top of one another. 
####################Sam's response to that:
#There are three chunks of code, one for each of the 3 scenarios. 
#Everytime you run one of the chunks of code, you need to rerun scripts 1,2,and 3, and make the changes in script 1 (the source model) 
#so that it is a different scenario being modelled. Otherwise, the lines will just plot over each other.
#For 0% restoration, 25% restoration, and 50% restoration scenarios, all you have to do is change the value in Line 13 of file "1.source_model"
#Then run scripts 1, 2, and 3 with that new value (and then the chunk of code for that simulation in this script)
#Don't run this entire script because you'll replace the values from t#All the lines in each plot lay on top of one another. 
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


#############SCENARIO C3, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucC3 <- seq(from = 1, to = 10000, by = 10)
ungulatescC3 <- rep(endP, 1000)
wolvescC3 <- rep(endW, 1000)
lfeaturescC3 <- rep(endL, 1000)
cC3xyzl <- cbind(cariboucC3, ungulatescC3, wolvescC3, lfeaturescC3)
cC3xyzl <- as.data.frame(cC3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data
csimcC3 <- vsim(Caproxc,cC3xyzl)
#View(csimC)
shadowtempcC3 <-csimcC3[[1]]
shadowcC3 <- shadowtempcC3[1:1000,1]
caribou_spcC3 <- cbind(cariboucC3, shadowcC3)
caribou_spcC3 <- as.data.frame(caribou_spcC3)


####### WOLF SHADOW PRICE
caribouwC3<- rep(endC, 1000)
ungulateswC3 <- rep(endP, 1000)
wolveswC3 <- seq(from = 1, to = 10000, by = 10)
lfeatureswC3 <- rep(endL, 1000)
wC3xyzl <- cbind(caribouwC3, ungulateswC3, wolveswC3, lfeatureswC3)
wC3xyzl <- as.data.frame(wC3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwC3 <- vsim(Caproxc,wC3xyzl)
#View(csimW)
shadowwolfwC3 <-csimwC3[[1]]
shadowwolfwC3 <- shadowwolfwC3[1:1000,3]
wolf_spwC3 <- cbind(wolveswC3, shadowwolfwC3)
wolf_spwC3 <- as.data.frame(wolf_spwC3)


####### Ungulates Shadow Price
caribouuC3<- rep(endC, 1000)
ungulatesuC3 <- seq(from =1, to = 1500000, by = 1500)
wolvesuC3 <- rep(endW, 1000)
lfeaturesuC3 <- rep(endL, 1000)
uC3xyzl <- cbind(caribouuC3, ungulatesuC3, wolvesuC3, lfeaturesuC3)
uC3xyzl <- as.data.frame(uC3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuC3 <- vsim(Caproxc,uC3xyzl)
#View(csimP)
shadowpreyuC3 <-csimuC3[[1]]
shadowpreyuC3 <- shadowpreyuC3[1:1000,2]
prey_spuC3 <- cbind(ungulatesuC3, shadowpreyuC3)
prey_spuC3 <- as.data.frame(prey_spuC3)


#######Linear Features Shadow Price
cariboufC3<- rep(endC, 1000)
ungulatesfC3 <- rep(endP, 1000)
wolvesfC3 <- rep(endW, 1000)
lfeaturesfC3 <- seq(from = 1, to = 300000, by = 300)
fC3xyzl <- cbind(cariboufC3, ungulatesfC3, wolvesfC3, lfeaturesfC3)
fC3xyzl <- as.data.frame(fC3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfC3 <- vsim(Caproxc,fC3xyzl)
#View(csimL)
shadowLFfC3 <- csimfC3[[1]]
shadowLFfC3 <- shadowLFfC3[1:1000,4]
LF_spfC3 <- cbind(lfeaturesfC3, shadowLFfC3)
LF_spfC3<- as.data.frame(LF_spfC3)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvC3 <- sim.out[70:170,2]
ungulatesvC3 <- sim.out[70:170,3]
wolvesvC3 <- sim.out[70:170,4]
lfeaturesvC3 <-  sim.out[70:170,5] 
wild_timevC3temp <- cbind(caribouvC3, ungulatesvC3, wolvesvC3, lfeaturesvC3)
csim.wildvC3 <- vsim(Caproxc,wild_timevC3temp)
wildspvC3temp <- csim.wildvC3[[1]]
wildspvC3 <- wildspvC3temp[,1:3]
wild_timevC3 <- wild_timevC3temp[,1:3]
wildpsvC3 <- as.data.frame(wildspvC3)
wild_timevC3 <- as.data.frame(wild_timevC3)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvC3$vfun[101]-csim.wildvC3$vfun[1]
sum((wild_timevC3temp[101,]-wild_timevC3temp[1,]) * (wildspvC3temp[101,]+wildspvC3temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevC3 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevC3[j,1]<-timew[j]
  deltavaluevC3[j,2]<- ((wild_timevC3[j+1,1]-wild_timevC3[j,1])*(wildspvC3[j+1,1]+wildspvC3[j,1])/2+ 
                          (wild_timevC3[j+1,2]-wild_timevC3[j,2])*(wildspvC3[j+1,2]+wildspvC3[j,2])/2 +
                          (wild_timevC3[j+1,3]-wild_timevC3[j,3])*(wildspvC3[j+1,3]+wildspvC3[j,3])/2) #- deltavaluevC3[1,2])
  deltavaluevC3[j,3] <- ((wild_timevC3[j+1,1]-wild_timevC3[j,1])*(wildspvC3[j+1,1]+wildspvC3[j,1])/2)# + 8650666.51) #-deltavaluevC3[1,3])
  deltavaluevC3[j,4] <- ((wild_timevC3[j+1,2]-wild_timevC3[j,2])*(wildspvC3[j+1,2]+wildspvC3[j,2])/2)# - 23277.88639) #- deltavaluevC3[1,4])
  deltavaluevC3[j,5] <- ((wild_timevC3[j+1,3]-wild_timevC3[j,3])*(wildspvC3[j+1,3]+wildspvC3[j,3])/2)# + 7074850.9) # - deltavaluevC3[1,5])
}

deltavaluevC3 <- deltavaluevC3[1:100,]
colnames(deltavaluevC3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevC3 <- as.data.frame(deltavaluevC3)
#View(deltavaluevC3)

#This gives the total change in value normalized to zero
deltavalueTOTvC3 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvC3[j,1]<-timew[j]
  deltavalueTOTvC3[j,2]<-sum(deltavaluevC3[1:j,2])
  deltavalueTOTvC3[j,3]<-sum(deltavaluevC3[1:j,3])
  deltavalueTOTvC3[j,4]<-sum(deltavaluevC3[1:j,4])
  deltavalueTOTvC3[j,5]<-sum(deltavaluevC3[1:j,5])
  
}
colnames(deltavalueTOTvC3) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvC3 <- as.data.frame(deltavalueTOTvC3)
deltavalueTOTvC3 <- rbind(zerostart, deltavalueTOTvC3)




