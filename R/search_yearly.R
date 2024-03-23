
#' search_yearly
#'
#' This function searches PubMed for articles matching a given search term. It prints a summary of the search results and the details of the top articles. It also fetches and writes RIS data of the articles to a file.
#'
#' @param search_term A character string specifying the search term for the PubMed query.
#' @param year An search year range with numeric format.
#' @param publication A character string specifying the publication name for the PubMed query.abbreviation of the journal name.
#' @import rentrez
#' @import ggplot2
#' @importFrom knitr kable
#' @importFrom utils head
#' @importFrom grDevices png dev.off
#' @export
#' @examples
#' search_yearly(2015:2019, "phenology", "Nature")

search_yearly <- function(year, search_term, publication=NULL) {
  # ... function body ...
}


##__________________####
library(rentrez)
library(ggplot2)

##function 2):overview papers with year by year####
search_year_info<- function(year, search_term, publication=NULL){
  query <- paste(search_term, "AND (", year, "[PDAT])","AND (",publication,"[JOUR])")
  sum_papers<-entrez_search(db="pubmed", term=query, retmax=0)$count
  print(sum_papers)
}

##function 3):visualize the overview####
search_plot <- function(year, search_term, publication=NULL) {
  #years <- as.numeric(unlist(strsplit(year, ":")))
  #year <- seq(from = years[1], to = years[2])
  no_papers <- sapply(year, search_year_info, search_term = search_term, publication = publication, USE.NAMES = FALSE)
  print(no_papers)
  # Save the plot
  if (is.null(publication)) {
    publication <- "all journals"
  }
  plot(year, no_papers, type = 'o', main = paste("The Rise of the [", search_term, "] in [", publication,"]" ))
  plot_filename <- paste0("plot_", search_term, paste(min(year),max(year), collapse = ":"), publication, ".png")
  png(plot_filename,width=600,height=400, res=100)
  plot(year, no_papers, type = 'o', main = paste("The Rise of the [", search_term, "] in [", publication,"]" ))
}

search_yearly1 <- function(year, search_term, publication=NULL) {
  #years <- as.numeric(unlist(strsplit(year, ":")))
  #year <- seq(from = years[1], to = years[2])
  no_papers <- sapply(year, search_year_info, search_term = search_term, publication = publication, USE.NAMES = FALSE)
  dt<-data.frame(year, no_papers,publication)
  print(dt)

}

search_yearly <- function(year, search_term, publication=NULL) {
  no_papers <- sapply(year, search_year_info, search_term = search_term, publication = publication, USE.NAMES = FALSE)
  if (is.null(publication)) {
    publication <- "all journals"
  }

  dt<-data.frame(year, no_papers,publication)
  print(dt)

}

search_ggplot <- function(year, search_term, publication=NULL) {
  #years <- as.numeric(unlist(strsplit(year, ":")))
  #year <- seq(from = years[1], to = years[2])
  no_papers <- sapply(year, search_year_info, search_term = search_term, publication = publication, USE.NAMES = FALSE)
  if (is.null(publication)) {
    publication <- "all journals"
  }

  dt<-data.frame(year, no_papers,publication)
  print(dt)
  ##generate the plot
  p=ggplot(dt,aes(x=year, y=no_papers))+
    geom_line(linewidth=0.3)+
    geom_point(linewidth=0.3)+
    labs(x="Year",y="Number of papers",title=paste("The Rise of the [", search_term, "] in [", publication,"]"))+
    #labs(x="Year",y="Number of papers",title=expression(paste("The Rise of the ", bold(search_term), " in ", italic(publication))))+
    theme_bw()+
    theme(line = element_blank(),
          panel.background = element_blank(),
          legend.box = "horizontal",
          legend.background = element_blank(),
          legend.position = "top",
          legend.title =element_blank(),
          legend.text = element_blank(),
          legend.direction = "horizontal",
          legend.key.size = unit(0,"cm"),
          axis.line = element_line(colour = "black"),
          axis.title = element_text(size=12,family = "Times"),
          axis.ticks=element_line(),
          axis.text = element_text(family = "Times"),
          axis.text.x = element_text(face="plain",size=7),
          strip.background = element_rect(colour = "gray",
                                          fill="gray"),
          strip.text.x = element_text(size=10,angle=0,
                                      face = "italic",
                                      family = "Times"),
          strip.text.y=element_text(size=10,angle=0,face="bold"))
  print(p)
  ##save the plot
  if (is.null(publication)) {
    publication <- "all journals"
  }
  plot_filename <- paste0("plot_", search_term, paste(min(year),max(year), collapse = ":"), publication, ".tiff")
  ggsave(plot_filename,plot=p,
         #device=tiff,
         height=9,width=18,
         unit="cm",dpi=600,compression="lzw")
}

