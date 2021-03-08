use "Data\hansen_dwi.dta", clear
generate bac_high = 0
replace bac_high = 1 if bac1 >= 0.08
DCdensity bac1, breakpoint(0.08) generate(Xj Yj r0 fhat se_fhat) graphname(Figures/BacDistribution.eps)
rdplot acc bac1, c(.08) graph_options(title("Accident"))
graph export Figures/Accident.eps
rdplot white bac1, c(.08) graph_options(title("White"))
graph export Figures/White.eps
rdplot male bac1, c(.08) graph_options(title("Male"))
graph export Figures/Male.eps
rdplot aged bac1, c(.08) graph_options(title("Age"))
graph export Figures/Age.eps