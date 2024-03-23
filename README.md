# AutoRef
# README
###### This is an updated package tailored for personal use, modified from the Rentrez package. For details about the package,go to [webpage] (https://cran.r-project.org/web/packages/rentrez/vignettes/rentrez_tutorial.html#getting-started-with-the-rentrez).
###### This adapted package is to facilitate literature searches and the directly export of .ris files, as well as to visualize the amounts of published literature year by year
###### If the search_term is too long to export a .ris file or .tiff, please go to search_inPubMed2() and search_ggplot2(),otherwise, just go to search_inPubMed() and search_ggplot().

##### some examples:
###### the default arguments: search_inPubMed(search_term="",year=NULL,publication=NULL,author=NULL,retmax=20);search_inPubMed2(search_term="",year=NULL,publication=NULL,author=NULL,retmax=20);
###### search_ggplot(search_term="",year=year,publication=NULL);search_ggplot2(search_term="",year=year,publication=NULL).
###### in the dataset pubmed provided by NCBI,there are following search field:
###### JOUR:   Journal abbreviation of publication
###### PDAT:   Publication date
###### UID:    Unique identifier
###### TITL:   words in title of publication
###### PTYP:   Type of publication (e.g., review) 
###### FAUT 	 First Author of publication 
###### FULL 	 Full Author Name(s) of publication 
###### LAUT 	 Last Author of publication 
###### LANG 	 Language of publication 
###### OTRM 	 Other terms associated with publication 
###### COLN 	 Corporate Author of publication 
###### CNTY 	 Country of publication 
###### PPDT 	 Date of print publication 
###### EPDT 	 Date of Electronic publication 
###### DSO 	 Additional text from the summary 
###### AUID 	 Author Identifier 
#


###### search_inPubMed(year="2000:2024",search_term="phenology",retmax=21),you will get a file named "RIS_phenology 2000:2024.ris" in the folder "ris_files"
###### search_inPubMed(search_term="phenology AND 2000:2024[PDAT]",retmax=21),you will get a file named "RIS_phenology AND 2000:2024[PDAT].ris" in the folder "ris_files"
###### Above two gives the same results.

###### If your search_term like this test_term="phosphorus OR phosphorus metabolism OR phosphorus homeostasis OR phosphorus transport OR phosphorus excretion OR phosphorus reabsorption OR phosphorus absorption OR phosphorus balance OR phosphorus regulation OR phosphorus deficiency OR phosphorus excess OR phosphorus toxicity OR phosphorus intake OR phosphorus diet OR phosphorus food OR phosphorus supplement OR phosphorus therapy OR phosphorus treatment",go to search_inPubMed2()

###### search_inPubMed2(search_term=test_term,year="2000:2024",retmax=21),you will get a file named "RIS_2000:2024.ris" in the folder "ris_files"
###### search_inPubMed2(search_term=paste(test_term,"2000:2024[PDAT]"),retmax=21),you will get a file named "RIS_.ris" in the folder "ris_files"
###### Above two gives the same results.
###### once more:
###### search_inPubMed2(search_term="phenology AND 2000:2024[PDAT]",retmax=21),you will get a file named "RIS_.ris" in the folder "ris_files"
###### search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol",retmax = 10)
###### search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol[JOUR] OR Nature",retmax = 10)
###### search_inPubMed2(year = "2020:2024", search_term = "phenology AND trees", publication = "New Phytol")



### for visualization of the search results:
###### search_ggplot(year=2000:2024, search_term="phosphorus", publication="Nature"),you will get a .tiff file with the title of "The rise of [phosphorus] in [Nature]" in the folder "figs",
###### search_ggplot(year=2000:2024, search_term="phosphorus", publication="Science"),you will get a .tiff file with the title of "The rise of [phosphorus] in [Science]" in the folder "figs"

###### search_ggplot(year=2000:2024, search_term=test_term, publication="Nature"),you will get a .tiff file with the title of "The rise of [] in [Nature]" in the folder "figs",
###### search_ggplot(year=2000:2024, search_term=test_term, publication="Science"),you will get a .tiff file with the title of "The rise of [] in [Science]" in the folder "figs".
