This repository supports the capn package (Natural Capital Asset Pricing for Nature) in R and provides a case study and example of capn applications on a conservation problem, the decline of woodland caribou in Alberta Canada.  The code in this repository is to be used with Maher et al. 2020, which can be found at https://esajournals.onlinelibrary.wiley.com/doi/abs/10.1002/eap.2132 and provides context and explanation for the model form and parameters. 

The code in this repository 1) Simulates population dynamics for 3 natural stocks (caribou, wolves, non-caribou ungulates) and one human-produced stock (linear features in the form of seismic lines constructed on the landscape for energy exploration; 2) Uses the capN package in R to approximate “shadow prices” for all four stocks; and 3) Allows for various counterfactual scenarios to be examined.

Open the “MASTER.R” file first.  There are 4 interacting scripts that can all be run from “MASTER.R” using the “source” function to generate outputs for each iteration:

1)	Source Model.  “1.source_model.R” is the base model describing the system dynamics and is to be used with all scenarios where there is no wolf hunting or control programs. “1a.source_model_wolfceiling.R” is adjusted so that wolf populations can be “capped” at a particular number. This number can be adjusted in the MASTER.R script by changing the “cap” variable. 

2)	Population Simulations. “2.caribou_dynamics” and “2a.caribou_dynamics_wolfceiling” simulate populations for each stock, starting in 1980 (Year 0) and continuing for the next 1,000 time steps (years).

3)	capN Package. “3.caribou_capn.R” and “3.caribou_capn_wolfceiling.R” use the capn package to approximate a vector or price coefficients, which is then applied to the data generated in each simulation to estimate shadow prices for each stock. The discount rate (the paper uses both 3% and 8%) can be changed in the MASTER.R script and enters the model here. 

4)	Specific Scenarios.  The last script run in each iteration from the “MASTER.R” script estimates the shadow price and total value functions under each counterfactual scenario being assessed. The naming convention is as follows: Letter A represents a scenario with no linear restoration, B has 25% of linear features restored, C has 50% of linear features restored, and D has 25% restoration and a wolf ceiling. The numbers 3 and 8 indicate the discount rate used. 
Notes about plotting results: 

Instructions:
