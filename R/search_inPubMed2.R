#' Search in PubMed2
#'
#' This function searches PubMed for articles matching a given search term. It prints a summary of the search results and the details of the top articles. It also fetches and writes RIS data of the articles to a file.
#'
#' @param search_term A character string specifying the search term for the PubMed query.
#' @param year search year range
#' @param author A character string specifying the last name of a author
#' @param publication A character string specifying the publication name for the PubMed query.abbreviation of the journal name.
#' @param retmax An integer specifying the maximum number of records to fetch. Defaults to 20.
#' @import rentrez
#' @importFrom knitr kable
#' @importFrom utils head
#' @importFrom grDevices png dev.off
#' @export
#' @examples
#' search_inPubMed2(year="2020:2024",search_term="phosphorus",retmax=301)
search_inPubMed2 <- function(search_term,year=NULL,publication=NULL,author=NULL, retmax=20) {
  # ... function body ...
}







##________________####
library(rentrez)

search_inPubMed2 <- function(search_term,year=NULL,publication=NULL,author=NULL, retmax=20) {
  # Search for articles on PubMed
  search_term_all<- paste(search_term, "AND (", year, "[PDAT])","AND (",publication,"[JOUR])","AND (",author,"[FAUT])")
  search_results <- entrez_search(db="pubmed", term=search_term_all, retmax=retmax, use_history=T)
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

  if (search_results$count>300){
    for( seq_start in seq(1,retmax,10)){
      ris_data <- entrez_fetch(db="pubmed", web_history=search_results$web_history,
                               rettype="medline", retmode="text",retmax=10, retstart=seq_start)
      filename <- paste0("RIS_",year,publication,author,".ris")
      dir.create("ris_files", showWarnings = FALSE)
      filename <- file.path("ris_files", filename)
      #write(ris_data, filename)
      cat(ris_data, file=filename, append=TRUE)
      cat(seq_start+10, "sequences downloaded\r")
    }}
  else{ris_data <- entrez_fetch(db="pubmed", id=search_results$ids, rettype="medline", retmode="text")
  # Write RIS data to a file
  filename <- paste0(year,publication,author,".ris")
  dir.create("ris_files", showWarnings = FALSE)
  filename <- file.path("ris_files", filename)
  write(ris_data, filename)}
}



