###########################################################################
#Samantha Maher
#Work completed while at the Yale School of the Environment, and EcoHealth Alliance Inc.
#contact at sam.maher@berkeley.edu or maher@ecohealthalliance.org
###########################################################################

#install.packages("capn") #only need to run if you have not already installed capn
#install.packages("ggplot2") #only need to run if you have not already installed ggplot
#install.packages("repmis")
library(capn) #https://cran.r-project.org/web/packages/capn/capn.pdf 
library(ggplot2)
library(repmis) 
library(R.oo) 
library(deSolve)
library(rprojroot)


#set working directory
P <- rprojroot::find_rstudio_root_file

#Scenario A3: No restoration, 3% discount rate
rec_prop <- 0.0
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE)  #output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .03
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/A3_norestoration_3dr.R"), local = FALSE)

#Scenario A8: No restoration, 8% discount rate
rec_prop <- 0.0
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE)#output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .08
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/A8_norestoration_8dr.R"), local = FALSE)

#Scenario B3: 25% restoration, 3% discount rate
rec_prop <- 0.25
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE)#output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .03
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/B3_25restoration_3dr.R"), local = FALSE)

#Scenario B8: 25% restoration, 8% discount rate
rec_prop <- 0.25
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE)#output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .08
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/B8_25restoration_8dr.R"), local = FALSE)

#Scenario C3: 50% restoration, 3% discount rate
rec_prop <- 0.50
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE)#output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .03
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/C3_50restoration_3dr.R"), local = FALSE)

#Scenario C8: 50% restoration, 8% discount rate
rec_prop <- 0.50
source(P("scripts/1.source_model.R"), local = FALSE)
source(P("scripts/2.caribou_dynamics.R"), local = FALSE) #output graph located in "Images" as "caribou_dynamics.tiff)
dr <- .08
source(P("scripts/3.caribou_capn.R"), local = FALSE)
source(P("scripts/C8_50restoration_8dr.R"), local = FALSE)

#Scenario D3: 25% restoration, wolf ceiling, 3% discount rate
rec_prop <- 0.25
cap <- 1660 #wolf ceiling
source(P("scripts/1a.source_model_wolfceiling.R"), local = FALSE)
source(P("scripts/2a.caribou_dynamics_wolfceiling.R"), local = FALSE)
dr <- .03
source(P("scripts/3a_caribou_capn_wolfceiling.R"), local = FALSE)
source(P("scripts/D3_wolfceiling_3dr.R"), local = FALSE)

#Scenario D8: 25% restoration, wolf ceiling, 8% discount rate
rec_prop <- 0.25
cap <- 1620  #A different wolf ceiling is required with an 8% discount rate.
source(P("scripts/1a.source_model_wolfceiling.R"), local = FALSE)
source(P("scripts/2a.caribou_dynamics_wolfceiling.R"), local = FALSE)
dr <- .08
source(P("scripts/3a_caribou_capn_wolfceiling.R"), local = FALSE)
source(P("scripts/D8_wolfceiling_8dr.R"), local = FALSE)


###PLOTTING
###Outputs are "tiff" files in "Images" folder
source(P("scripts/Plots_ShadowPrices.R"), local = FALSE)  #generates price curves for each stock at a 3% discount rate
#use hashtags to adjust plot to include 8% discount rate results as well
source(P("scripts/Plots_ValueThroughTime.R"), local = FALSE) #generates plots of value function through time for 3% discount rate 
#Use hastags to adjust scenarios included

