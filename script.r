# install.packages('Rcpp') # Makes installation of 'dyplr' work
# install.packages('dplyr')

# library(Rcpp)
# library(dplyr)


dir.Raw <- "RawData"
raw.Test <- paste0(dir.Raw,"/merged_2013_PP.csv")
df.Test <- read.csv(
	file = raw.Test
)

df.Subset <- df.Test[,c(
	"UNITID",
	"OPEID",
	"INSTNM",
	"CITY",
	"STABBR",
	"CONTROL",
	"UGDS",
	"UG",
	"ADM_RATE",
	"ADM_RATE_ALL",
	"NPT4_PUB",
	"NPT4_PRIV",
	"NPT4_PROG",
	"NPT4_OTHER",
	"COSTT4_A",
	"COSTT4_P",
	"TUITIONFEE_IN",
	"TUITIONFEE_OUT",
	"TUITIONFEE_PROG",
	"TUITFTE",
	"INEXPFTE",
	"DEBT_MDN",
	"RPY_5YR_RT"
)]

df.Subset2 <- transform(
	df.Subset,
	UGDS = as.numeric(as.character(UGDS)),
	DEBT_MDN = as.numeric(as.character(DEBT_MDN)),
	RPY_5YR_RT = as.numeric(as.character(RPY_5YR_RT))
)

df.FAU <- df.Subset2[df.Subset2$INSTNM=="Florida Atlantic University", ]

eda1.Summary <- summary(df.Subset2)


## THINGS TO CHECK
Repayment rates by university type (public, private, etc.)
Repayment rates over time, by university
Repayment rates by income level
Repayment rates by race?
Repayment rates by gender?
Group universities by undergrad population -- variable UGDS
