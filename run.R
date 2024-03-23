
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


##push to fihub
##in terminal

…or create a new repository on the command line
https://github.com/NaLuo12/AutoRef2.git
git remote add origin https://github.com/NaLuo12/AutoRef.git
git@github.com:NaLuo12/AutoRef2.git
echo "# AutoRef" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:NaLuo12/AutoRef.git
git push -u origin main


…or push an existing repository from the command line
git remote add origin git@github.com:NaLuo12/AutoRef.git
git branch -M main
git push -u origin main


git push origin main

