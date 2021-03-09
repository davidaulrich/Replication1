use "Data\hansen_dwi.dta", clear
generate bac_high = 0
replace bac_high = 1 if bac1 >= 0.08
DCdensity bac1, breakpoint(0.08) generate(Xj Yj r0 fhat se_fhat) graphname(Figures/BacDistribution.png)

rdrobust acc bac1, c(.08)
outreg2 using Tables/covs.doc, replace ctitle(Accident)
rdrobust white bac1, c(.08)
outreg2 using Tables/covs.doc, append ctitle(White)
rdrobust male bac1, c(.08)
outreg2 using Tables/covs.doc, append ctitle(Male)
rdrobust aged bac1, c(.08)
outreg2 using Tables/covs.doc, append ctitle(Age)

rdplot acc bac1, c(.08) p(1) graph_options(title("Accident"))
graph export Figures/Accident.png
rdplot white bac1, c(.08) p(1) graph_options(title("White"))
graph export Figures/White.png
rdplot male bac1, c(.08) p(1) graph_options(title("Male"))
graph export Figures/Male.png
rdplot aged bac1, c(.08) p(1) graph_options(title("Age"))
graph export Figures/Age.png

rdplot acc bac1, c(.08) p(2) graph_options(title("Accident"))
graph export Figures/AccidentQ.png
rdplot white bac1, c(.08) p(2) graph_options(title("White"))
graph export Figures/WhiteQ.png
rdplot male bac1, c(.08) p(2) graph_options(title("Male"))
graph export Figures/MaleQ.png
rdplot aged bac1, c(.08) p(2) graph_options(title("Age"))
graph export Figures/AgeQ.png

regress recidivism bac1 if bac1 >= .03 & bac1 <= .13, robust
outreg2 using Tables/reg.doc, replace ctitle(Linear)
rdrobust recidivism bac1, c(.08) h(.03 .13) p(1)
outreg2 using Tables/reg.doc, append ctitle(Linear with Cutoff)
rdrobust recidivism bac1, c(.08) h(.03 .13) p(2)
outreg2 using Tables/reg.doc, append ctitle(Quadratic with Cutoff)

regress recidivism bac1 if bac1 >= .055 & bac1 <= .105, robust
outreg2 using Tables/reg2.doc, replace ctitle(Linear)
rdrobust recidivism bac1, c(.08) h(.055 .105) p(1)
outreg2 using Tables/reg2.doc, append ctitle(Linear with Cutoff)
rdrobust recidivism bac1, c(.08) h(.055 .105) p(2)
outreg2 using Tables/reg2.doc, append ctitle(Quadratic with Cutoff)

regress recidivism bac1 if bac1 >= .03 & bac1 <= .13, robust
outreg2 using Tables/reg3.doc, replace ctitle(Linear)
rdrobust recidivism bac1 if bac1 <.15, c(.08) h(.03 .13) p(1)
outreg2 using Tables/reg3.doc, append ctitle(Linear with Cutoff)
rdrobust recidivism bac1 if bac1 <.15, c(.08) h(.03 .13) p(2)
outreg2 using Tables/reg3.doc, append ctitle(Quadratic with Cutoff)

regress recidivism bac1 if bac1 >= .055 & bac1 <= .105, robust
outreg2 using Tables/reg4.doc, replace ctitle(Linear)
rdrobust recidivism bac1 if bac1 <.15, c(.08) h(.055 .105) p(1)
outreg2 using Tables/reg4.doc, append ctitle(Linear with Cutoff)
rdrobust recidivism bac1 if bac1 <.15, c(.08) h(.055 .105) p(2)
outreg2 using Tables/reg4.doc, append ctitle(Quadratic with Cutoff)

rdplot recidivism bac1, c(.08) p(1) graph_options(title("Linear"))
graph export Figures/RecidL.png
rdplot recidivism bac1, c(.08) p(2) graph_options(title("Quadratic"))
graph export Figures/RecidQ.png