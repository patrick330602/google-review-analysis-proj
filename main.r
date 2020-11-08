stuff <- read.csv(file = "google_review_ratings.csv")
stuff$User <- NULL
stuff$X <- NULL

stuff <- apply(stuff, 2, function(x) as.numeric(as.character(x)))