
testpt <- SpatialPoints(matrix(c(149.2663,-33.4188), ncol =2, byrow = TRUE))
testptvals <- read.csv("./tests/testthat/-33.4188-150.2663_Precipitation_annual.csv") #downloaded from the explorer linked to here: http://wald.anu.edu.au/australias-environment/
b <- brick("http://dapds00.nci.org.au/thredds/dodsC/ub8/au/OzWALD/annual/OzWALD.annual.Pg.AnnualSums.nc", varname = "AnnualSums", dims = c(2, 1, 3))
obsvals <- extract(b, testpt)
testthat::expect_equivalent(testptvals$Value, obsvals, tol = 1E-4)

b <- brick("http://dapds00.nci.org.au/thredds/dodsC/ub8/au/OzWALD/daily/meteo/Tmin/OzWALD.Tmin.2018.nc", varname = "Tmin", dims = c(2, 3, 1))

plot(b, 1)