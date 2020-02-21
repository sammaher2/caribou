plot(csimcA3[["vfun"]] ~ caribou_spcA3$cariboucA3,
     cex = .05,
     col = "white",
     ylim = c(0,4000000000),
     xlim = c(0,5000),
     main = "Value Functions for Caribou at Full restoration, 2017")
lines(csimcA3[["vfun"]] ~ caribou_spcA3$cariboucA3, col = "red")
lines(csimcA8[["vfun"]] ~ caribou_spcA8$cariboucA8, col = "orange")
lines(csimcB3[["vfun"]] ~ caribou_spcB3$cariboucB3, col = "green")
lines(csimcB8[["vfun"]] ~ caribou_spcB8$cariboucB8, col = "blue")
lines(csimcC3[["vfun"]] ~ caribou_spcC3$cariboucC3, col = "purple")
lines(csimcC8[["vfun"]] ~ caribou_spcC8$cariboucC8, col = "black")
legend("topright", legend = c("3%","8%"), 
       col = c("red", "blue"), 
       lty = c(1,1,1,1,1), lwd = c(2,2,2,2,2,2), cex = 1.2)
legend("topright", legend = c("3%", "4%","5%","6%","7%","8%"), 
       col = c("red", "orange", "green", "blue", "purple", "black"), 
       lty = c(1,1,1,1,1), lwd = c(2,2,2,2,2,2), cex = 1.2)

plot(csimwA3[["vfun"]]~ wolf_spwA3$wolveswA3,
     cex = .05,
     col = "white",
     ylim = c(-4000000000,4000000000),
     xlim = c(0,10000),
     main = "Value Functions for Wolves at Full restoration, 2017")
lines(csimwA3[["vfun"]]~ wolf_spwA3$wolveswA3, lwd =3,lty = 1, col = "red")
lines(csimwA8[["vfun"]]~ wolf_spwA8$wolveswA8, lwd =3,lty = 1, col = "orange")
lines(csimwB3[["vfun"]]~ wolf_spwB3$wolveswB3, lwd =3,lty = 1, col = "green")
lines(csimwB8[["vfun"]]~ wolf_spwB8$wolveswB8, lwd =3,lty = 1, col = "blue")
lines(csimwC3[["vfun"]]~ wolf_spwC3$wolveswC3, lwd =3,lty = 1, col = "purple")
lines(csimwC8[["vfun"]]~ wolf_spwC8$wolveswC8, lwd =3,lty = 1, col = "black")


legend("topright", legend = c("3%", "4%","5%","6%","7%","8%"), 
       col = c("red", "orange", "green", "blue", "purple", "black"), 
       lty = c(1,1,1,1,1), lwd = c(2,2,2,2,2,2), cex = 1.2)

