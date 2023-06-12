# ************************************************************************
# Hodrick-Prescott Filter with Tail Correction for quarterly data
# Inputs:
#   lam: lambda parameter
#   ssg: avg. growth rate
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Last edited: June-2023
# Rodrigo Mariscal (rmariscalparedes@gmail.com)
# ************************************************************************
# This is free software: it is distributed without any warranty, you can 
# redistribute it or modify under the terms of the GNU General Public Li-
# cense as published by the Free Software Foundation.
# GNU General Public License at http://www.gnu.org/licenses/.
# ************************************************************************

hptc_q <- function(variable, lam, ssg){
  varlog <- as.matrix(log(variable))

  lambda <- lam
  ssgrow <- ssg

  kk <- 4
  x <- (1 + ssgrow / 100)^(1/4)-1
  
  ww <- length(varlog)
  G <- matrix(0,nrow=ww-2,ncol=ww)
  H <- matrix(0,nrow=ww,ncol=ww)
  VG <- matrix(0,nrow=ww,ncol=1)
  Id <- diag(1,ww)
  
  for (i in 1:nrow(G)) {
    G[i,i] = 1
    G[i,i+1] = -2
    G[i,i+2] = 1
  }
  
  for (i in (nrow(H)-kk+1):nrow(H)) {
    VG[i,1] = (1 + ssgrow / 100)^(1 / 4) - 1
    H[i,i-1] = -1
    H[i,i] = 1
  }
  
  POT <- solve(Id + lambda*t(G)%*%G + lambda*t(H)%*%H)%*%(varlog + lambda*t(H)%*%VG)
  POT <- exp(POT)
  return(POT)
}
