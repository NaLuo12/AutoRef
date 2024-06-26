% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search_inPubMed.R
\name{search_inPubMed}
\alias{search_inPubMed}
\title{Search in PubMed}
\usage{
search_inPubMed(
  search_term,
  year = NULL,
  publication = NULL,
  author = NULL,
  retmax = 20
)
}
\arguments{
\item{search_term}{A character string specifying the search term for the PubMed query.}

\item{year}{search year range}

\item{publication}{A character string specifying the publication name for the PubMed query.abbreviation of the journal name.}

\item{author}{A character string specifying the last name of a author}

\item{retmax}{An integer specifying the maximum number of records to fetch. Defaults to 20.}
}
\description{
This function searches PubMed for articles matching a given search term. It prints a summary of the search results and the details of the top articles. It also fetches and writes RIS data of the articles to a file.
}
\examples{
search_inPubMed(year="2000:2024",search_term="phenology",retmax=301)
}
