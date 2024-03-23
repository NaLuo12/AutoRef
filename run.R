
##run devtools::document() to generate
devtools::document()

##5) build the package
devtools::build()


##6) check the package
devtools::check()


##7) install the package
devtools::install()



##8) test the package

library(AutoReference)
# List the functions and objects in the package
ls("package:AutoReference")




