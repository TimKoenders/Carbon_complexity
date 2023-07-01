// Summary statistics
sum CO2tpc ECI GDP INQ UR GL

**Discrete average annual growth rate
g AAGRCO2tpc=(CO2tpc[_n+1]-CO2tpc[_n])/CO2tpc[_n]
g AAGRGDP=(GDP[_n+1]-GDP[_n])/GDP[_n]
g AAGRECI=(ECI[_n+1]-ECI[_n])/ECI[_n]
g AAGRINQ=(INQ[_n+1]-INQ[_n])/INQ[_n]
g AAGRUR=(UR[_n+1]-UR[_n])/UR[_n]
g AAGRGL=(GL[_n+1]-GL[_n])/GL[_n]
summarize AAGRCO2tpc
summarize AAGRGDP
summarize AAGRECI
summarize AAGRINQ
summarize AAGRUR
summarize AAGRGL

Difference in means
help robvar
help ttest 

robvar CO2tpc, by(SAMPLE)
robvar ECI, by(SAMPLE)
robvar GDP, by(SAMPLE)
robvar INQ, by(SAMPLE)
robvar UR, by(SAMPLE)
robvar GL, by(SAMPLE)

ttest CO2tpc, by(SAMPLE) unequal
ttest ECI, by(SAMPLE) unequal
ttest GDP, by(SAMPLE) unequal
ttest INQ, by(SAMPLE) unequal
ttest UR, by(SAMPLE) unequal
ttest GL, by(SAMPLE) unequal

asdoc summarize 

help fmm
Testing for Cross-sectional dependence
help xtcdf
xtcdf CO2tpc ECI ECIsqr INQ GDP UR GL
asdoc summarize
Testing for slope homogeneity
help xthst
xthst CO2tpc ECI ECIsqr D.GDP INQ UR GL

Testing for panel unit roots (CIPS) HO: Panels  contain unit root

help xtcips
xtcips CO2tpc, maxlags(10) bglags(10) 
xtcips ECI, maxlags(10) bglags(10) 
xtcips ECIsqr, maxlags(10) bglags(10)
xtcips INQ, maxlags(10) bglags(10)
xtcips UR, maxlags(10) bglags(10)
xtcips GL, maxlags(10) bglags(10)
xtcips GDP, maxlags(10) bglags(10)
xtcips D.GDP, maxlags(10) bglags(10)


Testing for panel unit roots (llc): HO: Panels  contain unit root

help xtunitroot 
xtunitroot llc CO2tpc, demean
xtunitroot llc ECI, demean
xtunitroot llc ECIsqr, demean
xtunitroot llc INQ, demean
xtunitroot llc GL, demean
xtunitroot llc UR, demean
xtunitroot llc GDP, demean

Introducing first differences

xtunitroot llc d.CO2tpc
xtunitroot llc d.ECI
xtunitroot llc d.INQ
xtunitroot llc d.GDP
xtunitroot llc d.GL
xtunitroot llc d.UR


Testing for panel unit roots (IPS): HO: All panels contain unit roots

xtunitroot ips CO2tpc, demean
xtunitroot ips ECI, demean
xtunitroot ips ECIsqr, demean
xtunitroot ips INQ, demean
xtunitroot ips GDP, demean
xtunitroot ips GL demean
xtunitroot ips UR, demean

Introducing first differences

xtunitroot ips d.CO2tpc, demean
xtunitroot ips d.ECI, demean
xtunitroot ips d.GDP, demean
xtunitroot ips d.INQ, demean
xtunitroot ips d.GL, demean
xtunitroot ips d.UR, demean
