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


#############SCENARIO F3, 0% restoration, 3% discount rate


######Caribou Shadow Price
cariboucF3 <- seq(from = 1, to = 5000, by = 10)
ungulatescF3 <- rep(endP, 500)
wolvescF3 <- rep(endW, 500)
lfeaturescF3 <- rep(endL, 500)
cF3xyzl <- cbind(cariboucF3, ungulatescF3, wolvescF3, lfeaturescF3)
cF3xyzl <- as.data.frame(cF3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Cxyzl)
## Simulation data

t_cF3xyzl<- matrix(0,nrow = length(cF3xyzl$cariboucF3), ncol = 1)
#simulate at nodes
for(j in 1:length(cF3xyzl$cariboucF3)){
  t_cF3xyzl[j,1]<-wval(cF3xyzl[j,1], cF3xyzl[j,2], cF3xyzl[j,3], cF3xyzl[j,4], sim.parmsW)
}

t_cF3xyzl <- array(as.vector(t_cF3xyzl), dim = c(500,1))
csimcF3 <- vsim(Caproxc, cF3xyzl, wval = t_cF3xyzl)


#View(csimC)
shadowtempcF3 <-csimcF3[[1]]
shadowcF3 <- shadowtempcF3[1:500,1]
caribou_spcF3 <- cbind(cariboucF3, shadowcF3)
caribou_spcF3 <- as.data.frame(caribou_spcF3)


####### WOLF SHADOW PRICE
caribouwF3<- rep(endC, 1000)
ungulateswF3 <- rep(endP, 1000)
wolveswF3 <- seq(from = 1, to = 10000, by = 10)
lfeatureswF3 <- rep(endL, 1000)
wF3xyzl <- cbind(caribouwF3, ungulateswF3, wolveswF3, lfeatureswF3)
wF3xyzl <- as.data.frame(wF3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Wxyzl)
## Simulation data
csimwF3 <- vsim(Caproxc,wF3xyzl)
#View(csimW)
shadowwolfwF3 <-csimwF3[[1]]
shadowwolfwF3 <- shadowwolfwF3[1:1000,3]
wolf_spwF3 <- cbind(wolveswF3, shadowwolfwF3)
wolf_spwF3 <- as.data.frame(wolf_spwF3)


####### Ungulates Shadow Price
caribouuF3<- rep(endC, 1000)
ungulatesuF3 <- seq(from =1, to = 1500000, by = 1500)
wolvesuF3 <- rep(endW, 1000)
lfeaturesuF3 <- rep(endL, 1000)
uF3xyzl <- cbind(caribouuF3, ungulatesuF3, wolvesuF3, lfeaturesuF3)
uF3xyzl <- as.data.frame(uF3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Pxyzl)
## Simulation data
csimuF3 <- vsim(Caproxc,uF3xyzl)
#View(csimP)
shadowpreyuF3 <-csimuF3[[1]]
shadowpreyuF3 <- shadowpreyuF3[1:1000,2]
prey_spuF3 <- cbind(ungulatesuF3, shadowpreyuF3)
prey_spuF3 <- as.data.frame(prey_spuF3)


#######Linear Features Shadow Price
cariboufF3<- rep(endC, 1000)
ungulatesfF3 <- rep(endP, 1000)
wolvesfF3 <- rep(endW, 1000)
lfeaturesfF3 <- seq(from = 1, to = 300000, by = 300)
fF3xyzl <- cbind(cariboufF3, ungulatesfF3, wolvesfF3, lfeaturesfF3)
fF3xyzl <- as.data.frame(fF3xyzl, row.names = c('xs', 'ys', 'zs', 'ls'))
#View(Lxyzl)
## Simulation data
csimfF3 <- vsim(Caproxc,fF3xyzl)
#View(csimL)
shadowLFfF3 <- csimfF3[[1]]
shadowLFfF3 <- shadowLFfF3[1:1000,4]
LF_spfF3 <- cbind(lfeaturesfF3, shadowLFfF3)
LF_spfF3<- as.data.frame(LF_spfF3)


####################  Value through time 2000 - 2100
#############
#######
####
#

timew <- seq(from = 1, to = 100, by = 1)

caribouvF3 <- sim.out[70:170,2]
ungulatesvF3 <- sim.out[70:170,3]
wolvesvF3 <- sim.out[70:170,4]
lfeaturesvF3 <-  sim.out[70:170,5] 
wild_timevF3temp <- cbind(caribouvF3, ungulatesvF3, wolvesvF3, lfeaturesvF3)
csim.wildvF3 <- vsim(Caproxc,wild_timevF3temp)
wildspvF3temp <- csim.wildvF3[[1]]
wildspvF3 <- wildspvF3temp[,1:3]
wild_timevF3 <- wild_timevF3temp[,1:3]
wildpsvF3 <- as.data.frame(wildspvF3)
wild_timevF3 <- as.data.frame(wild_timevF3)
##ELI ADDITIONS
#Each line gives an estimation of total change in value over next 100 years
#this includes the linear feature value, 
#but really that technology is getting replaced with new technologies 
csim.wildvF3$vfun[101]-csim.wildvF3$vfun[1]
sum((wild_timevF3temp[101,]-wild_timevF3temp[1,]) * (wildspvF3temp[101,]+wildspvF3temp[1,])/2)

#This gives the change in value during a time period 
deltavaluevF3 <- matrix(0, nrow = 100, ncol =5)
for(j in 1:100){
  deltavaluevF3[j,1]<-timew[j]
  deltavaluevF3[j,2]<- ((wild_timevF3[j+1,1]-wild_timevF3[j,1])*(wildspvF3[j+1,1]+wildspvF3[j,1])/2+ 
                        (wild_timevF3[j+1,2]-wild_timevF3[j,2])*(wildspvF3[j+1,2]+wildspvF3[j,2])/2 +
                        (wild_timevF3[j+1,3]-wild_timevF3[j,3])*(wildspvF3[j+1,3]+wildspvF3[j,3])/2) #- deltavaluevF3[1,2])
  deltavaluevF3[j,3] <- ((wild_timevF3[j+1,1]-wild_timevF3[j,1])*(wildspvF3[j+1,1]+wildspvF3[j,1])/2)# + 8650666.51) #-deltavaluevF3[1,3])
  deltavaluevF3[j,4] <- ((wild_timevF3[j+1,2]-wild_timevF3[j,2])*(wildspvF3[j+1,2]+wildspvF3[j,2])/2)# - 23277.88639) #- deltavaluevF3[1,4])
  deltavaluevF3[j,5] <- ((wild_timevF3[j+1,3]-wild_timevF3[j,3])*(wildspvF3[j+1,3]+wildspvF3[j,3])/2)# + 7074850.9) # - deltavaluevF3[1,5])
}

deltavaluevF3 <- deltavaluevF3[1:100,]
colnames(deltavaluevF3) <- c("year","wildlife","caribou","ungulates", "wolves")
deltavaluevF3 <- as.data.frame(deltavaluevF3)
#View(deltavaluevF3)

#This gives the total change in value normalized to zero
deltavalueTOTvF3 <- matrix(0, nrow = 100, ncol =5)
for (j in 1:100){
  deltavalueTOTvF3[j,1]<-timew[j]
  deltavalueTOTvF3[j,2]<-sum(deltavaluevF3[1:j,2])
  deltavalueTOTvF3[j,3]<-sum(deltavaluevF3[1:j,3])
  deltavalueTOTvF3[j,4]<-sum(deltavaluevF3[1:j,4])
  deltavalueTOTvF3[j,5]<-sum(deltavaluevF3[1:j,5])
  
}
colnames(deltavalueTOTvF3) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- matrix(0, nrow = 1, ncol =5)
colnames(zerostart) <- c("year","wildlife","caribou","ungulates", "wolves")
zerostart <- as.data.frame(zerostart)
deltavalueTOTvF3 <- as.data.frame(deltavalueTOTvF3)
deltavalueTOTvF3 <- rbind(zerostart, deltavalueTOTvF3)
