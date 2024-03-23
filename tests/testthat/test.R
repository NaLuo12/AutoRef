

##loading required packages####
require(rentrez)

search_inPubMed(search_term="phenology AND 2011:2024[PDAT] AND Glob Chang Biol[JOUR] AND Vitasse[FAUT]",retmax = 150)
search_inPubMed(search_term="phenology AND 2000:2024[PDAT] AND Nature[JOUR]",retmax = 100)

##
search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol[JOUR]",retmax = 10)
search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol[JOUR] OR Nature",retmax = 10)
search_inPubMed2(year = "2020:2024", search_term = "phenology AND trees", publication = "New Phytol")


##function 2):overview papers with year by year####
search_year_info(year="2001:2024", search_term="late spring frost AND phenology")
search_year_info(year="2001:2024", search_term="phenology",publication="Nature")
search_year_info(year="2001:2024", search_term="phenology",publication="Nature[JOUR] OR New Phytol")

##function 3):visualize the overview papers####
search_plot(year= 2015, search_term = "phenology", publication ="Nature")
search_plot(year= 2015, search_term = "phenology", publication ="Nature[JOUR] OR Glob Chang Biol")
search_plot(year= 2015:2019, search_term = "phenology")
search_plot(year = "2018", search_term = "phenology", publication ="Nature") ##yes
#search_plot(year = "2018:2020", search_term = "phenology", publication ="Nature") ##no

##
search_year_info(year="2021:2024", search_term="late spring frost AND phenology",publication=NULL)
search_plot(year =2021:2024, search_term = "phenology", publication =NULL)
search_yearly(year=2018:2024, search_term="phenology", publication="Nature[JOUR] OR Glob Chang Biol")
search_ggplot(year= 2020:2024, search_term = "phenology")

##
