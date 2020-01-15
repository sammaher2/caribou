#Does not print plots

##########DATA/DYNAMICS

#####Parameter values used ecological model
do <- 144399
iL<- 277306
rec_prop <- 0.25 #means 25% of total lines are restored, 
cap<-1975
#which is 50% 0of lines that are possible

sim.parmsE <- c(
  ##caribou
  rC = 0.175, #(*intrinsic growth rate of caribou, annual, LN(lamda)*)
  kC = 0.2*do, #(*carrying capcity of caribou*)
  hrC = 18.0, #(*handling time for caribou by wolves in hours*)
  mC = 140.0, #(*mass of average caribou in kg*)
  jC = 0.45, #(*hunting success rate of caribou by wolves after encounter*)
  ##ungulate (average parameter)
  rP = 0.25,  #*intrinsic growth rate for white tailed deer, annual*)
  kD = 5.1*do, #(*carrying capcity for WTD*)
  kM = 0.84*do, #(*carrying capacity of moose*)
  hrP = 30.0, #(*handling time for white-tailed deer*)
  mD = 80.0, #(*mass of white-tailed deer in kg*)
  mM = 434.0, #(*mass of a moose in kilograms*)
  jP = 0.45,  #(*hunting success rate of WTD by wolves after encounter*)
  g = 0.01, #Scaling coefficient for carrying capacity 
  ###wolves
  tau = 0.00001, #(*metabolic efficiency of wolves*)
  dom_coef = 10.0, #adjusts encounter rate with domain 
  ##initial populations (not needed?)
  iC = 2311, #(*initial caribou population*)
  iD = 1.2*do, #(*initial WTD population*)
  iW = 2600.0, #(*initial wolf population*)
  iM = 0.6*do, #(*initial moose population*)
  do = do, #Domain in terms of km^2
  iL = iL,  #Amount of linear features in kilometers
  legacy_grow = 0.009, #growth rate of legacy lines
  lf_grow = 0.02,   #grow rate of non-legacy lines
  rec_prop = rec_prop, #proportion of lines needing restoration
  a = 0.0499890170141911, #coefficients for equation determining rec_time
  b = -.00000995709435516459,
  c = -.0000000002062664077758624,
  cap = cap
)


#####FUNCTIONS (ECOLOGICAL)

#ECOLOGICAL MODEL
##### Carrying capacity of ungulate corrected to include both moose and deer and favorable effect of linear features

iP <-function(parameters) {
  with(as.list(c(parameters)),{
    return(iM*(mM/mD) + iD)
  })
}


## altered carry capacity formula to take account for initial k being adjsuted to ls amount
kP <- function(ls, parameters){
  with(as.list(c(parameters)),{
    return((kM*(mM/mD) + kD)+ (kM*(mM/mD) + kD)*g*log(1+ls/do)) #can i use lfs as dynamic here? or put instarting values
  })
}

####Logistic growth of caribou 
logC <- function(xs, parameters){
  with(as.list(c(parameters)),{
    return(rC*xs*(1 - xs/kC))
  })
}


#####Logistic growth of prey 
logP <- function(ys, ls,  parameters){
  with(as.list(c(parameters)),{
    return(rP*ys*(1-ys/kP(ls, parameters)))
  })
}

#####Encounter rate for wolves and caribou using McKinley formula
encount_C <- function(xs, ls, parameters){
  with(as.list(c(parameters)),{
    return((.0743*((xs/do)^1.15) + 0.00274*((xs/do)^1.15)*ls/do)/dom_coef)
  })
}


#####Encounter rate for wolves and ungualtes using McKinley formula
encount_P <- function(ys,ls, parameters){
  with(as.list(c(parameters)),{
    return((.0743*((ys/do)^1.15)*1.05/10 + 0.0*((ys/do)^1.15)*ls/do)/dom_coef)
  })
}

#####Attack rate for wolves on caribou 
attack_C <- function(xs,ls, parameters){
  with(as.list(c(parameters)),{
    return(encount_C(xs,ls, parameters) * jC)
  })
}

#####Attack rate for wolves on ungulates 
attack_P <- function(ys,ls, parameters){
  with(as.list(c(parameters)),{
    return(encount_P(ys, ls, parameters) * jP)
  })
}


#Rate of Growth in in LFs on landscape (assuming new ones are always stealth to start)
#####This is arbitrary right now
investlf <-function(ls, parameters) {
  with(as.list(c(parameters)),{
    return(ls*legacy_grow)
  })
}

#Decay/Restoration rate of Lfs on lanscape 
#We are going to start by treating stealth and traditional seismic the same. Too hard otherwise, base this offof Hauer 2018
#so it matters whats been put on in last 35 years, when they started getting reclaimed)
#####Also arbitrary 
restorelf <-function(xs,ls, parameters) {
  with(as.list(c(parameters)),{
    rec_time<- a+b*xs-c*xs^2
    rec_goal <- rec_time*rec_prop
    restore<-max(0,rec_goal*ls)
    return(restore)
  })
}


#baseline decay rate of 50 years, 50% will decay this way, 
#but the rest won't restore on their own. 
#if restoration is over 50%, this needs to be reduced to 1-rec_prop
decaylf <-function(ls, parameters) {
  with(as.list(c(parameters)),{
    decay <-(.5)*1/50
    return(decay*ls)
  })
}

#####TIME SIMUALTION OF DYNAMICAL SYSTEMS MODEL
##### DIFFERENITAL EQUATIONS

xdot <- function(xs, ys, zs,ls, parameters){
  with(as.list(c(parameters)),{
    return(logC(xs,parameters) - 8760*zs*(attack_C(xs, ls, parameters) /  
                                            (1 + attack_C(xs, ls, parameters)*hrC + attack_P(ys, ls, parameters)*hrP)))
  })
}

ydot <- function(xs, ys, zs, ls, parameters){
  with(as.list(c(parameters)),{
    return(logP(ys, ls, parameters) - 8760*zs*(attack_P(ys, ls, parameters)/
                                                 (1+attack_C(xs, ls, parameters)*hrC + attack_P(ys, ls, parameters)*hrP)))
  })
}

zdot <- function(xs, ys, zs, ls, parameters){
  with(as.list(c(parameters)),{
    if(zs>cap){
      growth <- cap-zs
    } else {
      growth <- 8760*zs*tau*((attack_C(xs, ls, parameters)*mC + mD*attack_P(ys, ls, parameters))/
                                  (1+attack_C(xs, ls, parameters)*hrC + attack_P(ys, ls, parameters)*hrP))-(zs^2)/do
    }
      return(growth)
  })
}

ldot <- function(xs, ys, zs, ls, parameters){
  with(as.list(c(parameters)),{
    return(investlf(ls, parameters)-restorelf(xs, ls, parameters)
           -decaylf(ls, parameters))
  })
}


##### TIME SIMULATION OF MODEL 
dxdydzdlCC <- function(t, state, parms){
  with(as.list(c(parms)),{
    with(as.list(state),{
      dx <- xdot(xs, ys, zs, ls, parms)
      dy <- ydot(xs, ys, zs, ls, parms)
      dz <- zdot(xs, ys, zs, ls, parms)
      dl <- ldot(xs, ys, zs, ls, parms)
      return(list(c(dx,dy,dz,dl)))
    })})
}

households <- 1256190.0 #Harper 2012
con1 <- 433.868503 #to the power and numerator
con2 <- 724.208184 # coefficient in denomenator    
sim.parmsW <- c(
  ann = .04, #(annuitizing coefficient)
  ##Value of LFs, Hauer 2010
  wells = 0.0, #number of wells in region
  ANPV_gas = 0.0, #annuitized NPV of oil, bitumen, natural gas total
  ANPV_oil = 0.0,
  ANPV_bit = 0.0,
  sat_co = 10761, #half saturation rate for lfs
  half_sat = 14019279, #linear feature saturation coefficent
  do = 0.0, #how many km^2 of area the lfs cover so we can convert from density to kms
  ##Investment in LFs
  ##Reclamation of LFs
  rec_cost = 12500.0, #cost to restore 1 km of lfs, 
  a = 0.0499890170141911, #coefficients for equation determining rec_time
  b = -.00000995709435516459,
  c = -.0000000002062664077758624,
  #rec_time = 1/35, #1 divided by number of years it takes to restore
  rec_prop = rec_prop, #.5, #proportion of lines being restored overall 
  #proportion of lfs restored in a year
  ##Conservation Value, harper 2012
  #only dependent on caribou as of now.
  households = households, #Harper 2012
  con1 = 433.868503, #to the power and numerator
  con2 = 724.208184, # coefficient in denomenator
  ##Wolf Control
  wcull_ratio = 0.0, #ratio of wolves culled in relation to 40% baseline
  wcull_cost = 35.0, #cost per km^2 to cull 40% of wolves
  ##Prey Control
  w_target = .4,
  w_target_base = .4, #proprtion of wolves killed that 35$ cost is based on
  #maybe make these proportion dependent on the number of caribou??
  pcull_cost = 35,    #cost to cull per km^2 per year
  dr = 1.0
)

#already annuitized
lf_value <-function(ls,parameters) {
  with(as.list(c(parameters)),{
    return(1000000*sat_co*ls/(half_sat+ls))
  })
}


######Investment in Linear Features
#This is 0 right now because we are assuming cost of seismic 
#is in inclued in lf_value which is netted out
lf_invest <-function(ls, parameters) {
  with(as.list(c(parameters)),{
    return(0) 
  })
}

######Reclamation of Linear Features

lf_reclaim <-function(xs, ls, parameters) {
  with(as.list(c(parameters)),{
    rec_time<- a+b*xs-c*xs^2
    rec_goal <- rec_time*rec_prop
    restore<-max(0,rec_goal*ls)
    return(restore*rec_cost)
  })
}


#####Conservation Value of Caribou (Harper)
caribou_value <-function(xs, parameters) {
  with(as.list(c(parameters)),{
    return(0*(con1*xs/(con2+xs)*households))
  })
}

w_control <-function(zs, parameters) {
  with(as.list(c(parameters)),{
    return(wcull_ratio*wcull_cost*do)
  })
}


p_control <-function(ys, parameters) {
  with(as.list(c(parameters)),{
    pcull_ratio = w_target/w_target_base #scalar from baseline of 40% wolves culled per year. assuming costs are proportional
    return(pcull_ratio*pcull_cost*do)
  })
}


##### Utility, NB, Real income index function
wval <-function(xs, ys, zs, ls, parameters) {
  with(as.list(c(parameters)),{
    return(lf_value(ls, parameters) 
           - lf_reclaim(xs,ls, parameters) 
           + caribou_value(xs, parameters) 
           - w_control(zs, parameters) 
           - p_control(ys, parameters))             
  })
}