
library(parallel);
options(Ncpus = (detectCores(logical = FALSE)-1))
install.packages("remotes", dependencies = TRUE)
remotes::install_github("janmarvin/openxlsx@gh_issue_333")
