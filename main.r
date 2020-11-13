setwd("~/Git/google-review-analysis")
stuff <- read.csv(file = "google_review_ratings.csv")
stuff$User <- NULL
stuff$X <- NULL

stuff <- apply(stuff, 2, function(x) as.numeric(as.character(x)))
stuff <- apply(stuff, row.names=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25))
# possibly not used forever
# this returns the incomplete data; since 0 means don't have any data
# True if there is a 0
#stuff_z_index <- apply(stuff, 1, function(r) any(r == 0)) 

# Function for sorting the value:
#   0.0       -> 0 (This actually means not data for this cat.)
#   0.0 - 1.4 -> 1
#   1.5 - 2.4 -> 2
#   2.5 - 3.4 -> 3
#   3.5 - 4.4 -> 4
#   4.5 - 5.0 -> 5
valSort <- function(num) {
  if (is.na(num)) {
    return(0)
  } else if ((num < 0) | (num > 5)) {
    return(6)
  } else if (num == 0) {
    return(0)
  } else if (num < 1.5) {
    return(1)
  } else if (num < 2.5) {
    return(2)
  } else if (num < 3.5) {
    return(3)
  } else if (num < 4.5) {
    return(4)
  } else if (num <= 5) {
    return(5)
  }
}

processed_stuff <- structure(vapply(stuff, valSort, numeric(1)), dim=dim(stuff))
