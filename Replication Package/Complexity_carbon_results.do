xtset COUNTRY Year

// Pooled OLS and fixed effects
help xtscc

xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR
xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR if SAMPLE==1
xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR if SAMPLE==3
xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR i.Year i.COUNTRY
xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR i.Year i.COUNTRY if SAMPLE==1
xtscc  CO2tpc ECI ECIsqr INQ GL D.GDP UR i.Year i.COUNTRY if SAMPLE==3

nlcom _b[ECI]/-(2*_b[ECIsqr])
summarize ECI
test  ECI ECIsqr
summarize ECI if Year==2019

summarize ECI if Year==2019
summarize CO2tpc if Year==2019
nlcom _b[ECI]/-(2*_b[ECIsqr])
test ECI ECIsqr

// testing for number of classes K, unconditional versus conditional //
fmm 1, iter(1000): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR 
estimates store u1
fmm 2, iter(1000): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR 
estimates store u2
fmm 3, iter(1000): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR 
estimates store u3
fmm 4, iter(1000): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
estimates store u4
** from class 4 onwards convergence not achieved 

fmm 1,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
estimates store c1
fmm 2,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
estimates store c2
fmm 3,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
estimates store c3
fmm 4, iter(1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
estimates store c4
** from class 4 onwards convergence not achieved 

estimates stats u1 u2 u3 c1 c2 c3 

// testing for the equality of coefficients (unconditional)
fmm 3,iter (1000): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
fmm, coeflegend
**Equality of All Parameters
**regime-1 versus regime-2
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 2.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 2.Class#c.ECIsqr], accumulate
test _b[CO2tpc:1.Class#c.INQ]=_b[CO2tpc:2.Class#c.INQ],accumulate
test _b[CO2tpc:1.Class#c.GL]=_b[CO2tpc:2.Class#c.GL],accumulate
test _b[CO2tpc:1.Class#cD.GDP]=_b[CO2tpc:2.Class#cD.GDP], accumulate
test _b[CO2tpc:1.Class#c.UR]=_b[CO2tpc:2.Class#c.UR], accumulate
**regime-1 versus regime-3
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
test _b[CO2tpc:1.Class#c.INQ]=_b[CO2tpc:3.Class#c.INQ],accumulate
test _b[CO2tpc:1.Class#c.GL]=_b[CO2tpc:3.Class#c.GL],accumulate
test _b[CO2tpc:1.Class#cD.GDP]=_b[CO2tpc:3.Class#cD.GDP], accumulate
test _b[CO2tpc:1.Class#c.UR]=_b[CO2tpc:3.Class#c.UR], accumulate
**regime-2 versus regime-3
test _b[CO2tpc:2.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:2.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
test _b[CO2tpc:2.Class#c.INQ]=_b[CO2tpc:3.Class#c.INQ],accumulate
test _b[CO2tpc:2.Class#c.GL]=_b[CO2tpc:3.Class#c.GL],accumulate
test _b[CO2tpc:2.Class#cD.GDP]=_b[CO2tpc:3.Class#cD.GDP], accumulate
test _b[CO2tpc:2.Class#c.UR]=_b[CO2tpc:3.Class#c.UR], accumulate
**Equality of Economic Complexity
**regime-1 versus regime-2
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 2.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 2.Class#c.ECIsqr], accumulate
**regime-1 versus regime-3
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
**regime-2 versus regime-3
test _b[CO2tpc:2.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:2.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate

// testing for the equality of coefficients (conditional)
fmm 3,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
fmm, coeflegend
**Equality of All Parameters
**regime-1 versus regime-2
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 2.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 2.Class#c.ECIsqr], accumulate
test _b[CO2tpc:1.Class#c.INQ]=_b[CO2tpc:2.Class#c.INQ],accumulate
test _b[CO2tpc:1.Class#c.GL]=_b[CO2tpc:2.Class#c.GL],accumulate
test _b[CO2tpc:1.Class#cD.GDP]=_b[CO2tpc:2.Class#cD.GDP], accumulate
test _b[CO2tpc:1.Class#c.UR]=_b[CO2tpc:2.Class#c.UR], accumulate
**regime-1 versus regime-3
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
test _b[CO2tpc:1.Class#c.INQ]=_b[CO2tpc:3.Class#c.INQ],accumulate
test _b[CO2tpc:1.Class#c.GL]=_b[CO2tpc:3.Class#c.GL],accumulate
test _b[CO2tpc:1.Class#cD.GDP]=_b[CO2tpc:3.Class#cD.GDP], accumulate
test _b[CO2tpc:1.Class#c.UR]=_b[CO2tpc:3.Class#c.UR], accumulate
**regime-2 versus regime-3
test _b[CO2tpc:2.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:2.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
test _b[CO2tpc:2.Class#c.INQ]=_b[CO2tpc:3.Class#c.INQ],accumulate
test _b[CO2tpc:2.Class#c.GL]=_b[CO2tpc:3.Class#c.GL],accumulate
test _b[CO2tpc:2.Class#cD.GDP]=_b[CO2tpc:3.Class#cD.GDP], accumulate
test _b[CO2tpc:2.Class#c.UR]=_b[CO2tpc:3.Class#c.UR], accumulate
**Equality of Economic Complexity
**regime-1 versus regime-2
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 2.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 2.Class#c.ECIsqr], accumulate
**regime-1 versus regime-3
test _b[CO2tpc:1.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:1.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate
**regime-2 versus regime-3
test _b[CO2tpc:2.Class#c.ECI] = _b[CO2tpc: 3.Class#c.ECI]
test _b[CO2tpc:2.Class#c.ECIsqr] = _b[CO2tpc: 3.Class#c.ECIsqr], accumulate


// preferred specification 
fmm 3,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR

**calculate the turning points for FMM classes 
nlcom turning_point_1: (-_b[CO2tpc:1.Class#c.ECI])/(2*(_b[CO2tpc:1.Class#c.ECIsqr]))
nlcom turning_point_2: (-_b[CO2tpc:2.Class#c.ECI])/(2*_b[CO2tpc:2.Class#c.ECIsqr])
nlcom turning_point_3: (-_b[CO2tpc:3.Class#c.ECI]/(2*_b[CO2tpc:3.Class#c.ECIsqr]))

summarize ECI if predclass==1
summarize ECI if predclass==2
summarize ECI if predclass==3
summarize CO2tpc if predclass==1
summarize CO2tpc if predclass==2
summarize CO2tpc if predclass==3
summarize ECI if predclass==1 & Year==2019
summarize ECI if predclass==2 & Year==2019
summarize ECI if predclass==3 & Year==2019

// analysis of the classes, turning points and time stability
fmm 3,iter (1000) lcprob(ECI): regress CO2tpc ECI ECIsqr INQ GL D.GDP UR
predict c*, classpr
predict cpost*, classposteriorpr
egen max = rowmax(cpost*)
gen predclass = 1 if cpost1==max
replace predclass = 2 if cpost2==max
replace predclass = 3 if cpost3==max
list Country Year predclass









