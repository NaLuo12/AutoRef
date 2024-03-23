

# Install and load the rentrez package####
if (!requireNamespace("rentrez", quietly = TRUE)) {
  install.packages("rentrez")
}

##
library(rentrez)
citation("rentrez")
packageVersion("rentrez")


# Set your email for NCBI's API access
entrez_global_query(email="naluo.luona@gmail.com")##not working

##1）view databases available in NCBI####
entrez_dbs()

##2）brief describtion of the database####
entrez_db_summary("pubmed")
##3）to check searching field####
entrez_db_searchable(db = "pubmed")
#JOUR:   Journal abbreviation of publication
#PDAT:   Publication date
#UID:    Unique identifier
#TITL:   words in title of publication
#PTYP:   Type of publication (e.g., review)
#FAUT 	 First Author of publication
#FULL 	 Full Author Name(s) of publication
#LAUT 	 Last Author of publication


#LANG 	 Language of publication
#OTRM 	 Other terms associated with publication
#COLN 	 Corporate Author of publication
#CNTY 	 Country of publication

#
#PPDT 	 Date of print publication
#EPDT 	 Date of Electronic publication
#DSO 	 Additional text from the summary
#AUID 	 Author Identifier
#

##4）view arguments of functions####
args(entrez_search)
function (db, term, config = NULL, retmode = "xml", use_history = FALSE, ...)

  args(entrez_fetch)
function (db, id = NULL, web_history = NULL, rettype, retmode = "",
          parsed = FALSE, config = NULL, ...)

  args(entrez_summary)
function (db, id = NULL, web_history = NULL, version = c("2.0", "1.0"), always_return_list = FALSE, retmode = NULL, config = NULL, ...)

  args(entrez_link)
function (dbfrom, web_history = NULL, id = NULL, db = NULL, cmd = "neighbor",
          by_id = FALSE, config = NULL, ...)

  args(entrez_db_searchable)
function (db, config = NULL)

  args(entrez_info)
function (db = NULL, config = NULL)
  args(entrez_citmatch)
function (bdata, db = "pubmed", retmode = "xml", config = NULL)

  args(extract_from_esummary)

##5）abbreviations of journal names####
#New Phytol
#Glob Chang Biol

#search for articles on PubMed####
#The EUtils API uses a special syntax to build search terms.
#You can search a database against a specific term using the format query[SEARCH FIELD],
#and combine multiple such searches using the boolean operators AND, OR and NOT

##1) key words####
search_terms <- "late spring frost AND phenology"
search_results <- entrez_search(db = "pubmed", term = search_terms,retmax = 150,use_history = FALSE)##retmax is the maximum number of records to return
search_results
search_results$ids
search_results

# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##1-1) key words with a range of publication date####
search_terms <- "late spring frost effects on trees AND 2019/01/01:2024/01/01[PDAT]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 20)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##1-2) key words with a range of publication date and journal name####
search_terms <- "carbon AND 2019/01/01:2024/01/01[PDAT] AND Nature[JOUR]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 20)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##2)first author name####
search_terms <- "Hong[FAUT]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 5)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##
##3)journal name####
search_terms <- "Nature[JOUR]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 5)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##4)publication date with a range####
search_terms <- "2019/01/01:2024/01/01[PDAT]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 10)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##5)journal name and publication date####
search_terms <- "Nature[JOUR] AND 2019/01/01:2020/01/01[PDAT]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 10)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##6)journal name and publication date and author name####
search_terms <- "Nat. Commun[JOUR] AND 2018/01/01:2024/01/01[PDAT] AND Hong[FAUT]"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 20)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)


##7)journal name and year####
search_terms <- "(Nature[JOUR] AND 2023[PDAT])"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 10)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)


##8)journal name and year and author name####
search_terms <- "(Nat. Commun[JOUR] AND 2023[PDAT] AND Hong[FAUT])"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 10)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$title, a$pubdate, a$source))
print(article_info)

##9)journal name and year and author name and title####
search_terms <- "(Nat. Commun[JOUR] AND 2023[PDAT] AND Hong[FAUT] AND carbon)"
search_results <- entrez_search(db = "pubmed", term = search_terms, retmax = 10)
search_results$ids
# Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
# Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$authors,a$title, a$pubdate, a$source))
print(article_info)


article_info2 <- extract_from_esummary(articles, c("pubdate", "title","fulljournalname","pmcrefcount","pubtype"))
knitr::kable(head(t(article_info2)), row.names=FALSE)



#output .ris file####

# Fetch records in RIS format
#rettype to specify the format you'd like the record in
ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype="medline", retmode="text") ## work for both endnote and Zotero
ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype=NULL, retmode="xml") ## work for Zotero

# Write RIS data to a file
write(ris_data, "search_results2.ris")

##____________________####
##custome functions####
##procedure for function generation####
search_terms <- "late spring frost AND phenology"
search_results <- entrez_search(db = "pubmed", term = search_terms,retmax = 150,use_history = FALSE)##retmax is the maximum number of records to return
search_results$count
#Fetch details of the articles
articles <- entrez_summary(db = "pubmed", id = search_results$ids)
#Get the information in a more readable form
article_info <- lapply(articles, function(a) c(a$authors[1],a$title, a$pubdate, a$source))
print(article_info)
##
article_info2 <- extract_from_esummary(articles, c("pubdate", "title","fulljournalname","pmcrefcount","pubtype"))
knitr::kable(head(t(article_info2),n=retmax), row.names=FALSE)
##
ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype="medline", retmode="text") ## work for both endnote and Zotero
write(ris_data, "late spring frost AND phenology.ris")





##function 1): search function####
library(rentrez)
search_inPubMed <- function(search_term, retmax=20) {
  # Search for articles on PubMed
  search_results <- entrez_search(db="pubmed", term=search_term, retmax=retmax, use_history=FALSE)
  print(search_results)##view how many records are found
  # Fetch details of the articles
  articles <- entrez_summary(db="pubmed", id=search_results$ids)
  # Get the information in a more readable form
  ##option1
  #article_info <- lapply(articles, function(a) c(a$authors[1], a$title, a$pubdate, a$source))
  #print(article_info)

  ##option2
  article_info2 <- extract_from_esummary(articles, c("pubdate", "title","fulljournalname","pmcrefcount"))
  print(knitr::kable(head(t(article_info2),n=retmax), row.names=FALSE))
  # Fetch RIS data
  ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype="medline", retmode="text")
  # Write RIS data to a file
  filename <- paste0(search_term, ".ris")
  write(ris_data, filename)
}


search_inPubMed(search_term="phenology AND 2011:2024[PDAT] AND Glob Chang Biol[JOUR] AND Vitasse[FAUT]",retmax = 150)
##
search_inPubMed(search_term="phenology AND 2000:2024[PDAT] AND Nature[JOUR]",retmax = 100)


search_inPubMed2 <- function(search_term,year,publication=NULL,author=NULL, retmax=20) {
  # Search for articles on PubMed
  search_term_all<- paste(search_term, "AND (", year, "[PDAT])","AND (",publication,"[JOUR])","AND (",author,"[FAUT])")
  search_results <- entrez_search(db="pubmed", term=search_term_all, retmax=retmax, use_history=FALSE)
  print(search_results)##view how many records are found
  # Fetch details of the articles
  articles <- entrez_summary(db="pubmed", id=search_results$ids)
  # Get the information in a more readable form
  ##option1
  #article_info <- lapply(articles, function(a) c(a$authors[1], a$title, a$pubdate, a$source))
  #print(article_info)

  ##option2
  article_info2 <- extract_from_esummary(articles, c("pubdate", "title","fulljournalname","pmcrefcount"))
  print(knitr::kable(head(t(article_info2),n=retmax), row.names=FALSE))
  # Fetch RIS data
  ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype="medline", retmode="text")
  # Write RIS data to a file
  filename <- paste0(search_term,year,publication,author,".ris")
  write(ris_data, filename)
}
search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol[JOUR]",retmax = 10)
search_inPubMed2(search_term="phenology AND late spring frost",year="2018:2024",publication="Glob Chang Biol[JOUR] OR Nature",retmax = 10)




##function 2):overview papers with year by year####
search_year_info<- function(year, search_term, publication=NULL){
  query <- paste(search_term, "AND (", year, "[PDAT])","AND (",publication,"[JOUR])")
  sum_papers<-entrez_search(db="pubmed", term=query, retmax=0)$count
  print(sum_papers)
}
search_year_info(year="2001:2024", search_term="late spring frost AND phenology")
search_year_info(year="2001:2024", search_term="phenology",publication="New Phytol")
search_year_info(year="2001:2024", search_term="phenology",publication="Nature")
search_year_info(year="2001:2024", search_term="phenology",publication="Nature[JOUR] OR New Phytol")

##function 3):visualize the overview papers####
##to apply the search_year_info function to each year in the year vector###
##procedure####
year1<-2018:2024
no_papers <- sapply(year=year1, search_year_info, search_term="phenology", publication="Nature",USE.NAMES=F)
print(no_papers)
plot(year, no_papers, type = 'o', main = paste("The Rise of the [", term, "] in [", publication,"]" ))


search_plot <- function(year, search_term, publication=NULL) {
  #years <- as.numeric(unlist(strsplit(year, ":")))
  #year <- seq(from = years[1], to = years[2])
  no_papers <- sapply(year, search_year_info, search_term = search_term, publication = publication, USE.NAMES = FALSE)
  print(no_papers)
  # Save the plot
  if (is.null(publication)) {
    publication <- "all journals"
  }
  plot_filename <- paste0("plot_", search_term, paste(min(year),max(year), collapse = ":"), publication, ".png")
  png(plot_filename,width=600,height=400, res=100)
  plot(year, no_papers, type = 'o', main = paste("The Rise of the [", search_term, "] in [", publication,"]" ))
  dev.off()
}


search_plot(year= 2015, search_term = "phenology", publication ="Nature")
search_plot(year= 2015, search_term = "phenology", publication ="Nature[JOUR] OR Glob Chang Biol")
search_plot(year= 2015:2019, search_term = "phenology")
search_plot(year = "2018", search_term = "phenology", publication ="Nature") ##yes
search_plot(year = "2018:2020", search_term = "phenology", publication ="Nature") ##no

##
search_year_info(year="2021:2024", search_term="late spring frost AND phenology",publication=NULL)
search_plot(year =2021:2024, search_term = "late spring frost AND phenology", publication =NULL)
perform_pubmed_search(search_term="phenology AND 2001:2024[PDAT] AND Nature[JOUR]",retmax = 150)

##



