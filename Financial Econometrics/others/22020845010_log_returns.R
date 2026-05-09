# Import Historical Stock price
lupin <- read.csv("LUPIN.csv")
bajaj <- read.csv("BAJAJ-AUTO.NS.csv")
tata <- read.csv("TATAMOTORS.NS.csv")
tvs <- read.csv("TVSMOTOR.NS.csv")

# Columns to remove 
columns_to_remove <- c("Open", "High",	"Low", "Close", "Volume")

lupin <- lupin[, -which(names(lupin) %in% columns_to_remove)]
bajaj <- bajaj[, -which(names(bajaj) %in% columns_to_remove)]
tata <- tata[, -which(names(tata) %in% columns_to_remove)]
tvs <- tvs[, -which(names(tvs) %in% columns_to_remove)]

# Calculate Log Returns
lupin_log_return <- data.frame(diff(log(lupin$Adj.Close),lag=1)*100)
bajaj_log_return <- data.frame(diff(log(bajaj$Adj.Close),lag=1)*100)
tata_log_return <- data.frame(diff(log(tata$Adj.Close),lag=1)*100)
tvs_log_return <- data.frame(diff(log(tvs$Adj.Close),lag=1)*100)

# Merging Data
log_returns <- bajaj[-1, ]

bajaj <- bajaj[-1, ]
lupin <- lupin[-1, ]
tata <- tata[-1, ]
tvs <- tvs[-1, ]

bajaj$bajaj_log_return <- bajaj_log_return$diff.log.bajaj.Adj.Close...lag...1....100
lupin$lupin_log_return <- lupin_log_return$diff.log.lupin.Adj.Close...lag...1....100
tata$tata_log_return <- tata_log_return$diff.log.tata.Adj.Close...lag...1....100
tvs$tvs_log_return <- tvs_log_return$diff.log.tvs.Adj.Close...lag...1....100

column_to_remove <- c("Adj.Close")

lupin <- lupin[, -which(names(lupin) %in% column_to_remove)]
bajaj <- bajaj[, -which(names(bajaj) %in% column_to_remove)]
tata <- tata[, -which(names(tata) %in% column_to_remove)]
tvs <- tvs[, -which(names(tvs) %in% column_to_remove)]

log_returns <- cbind(bajaj, tata, tvs, by = "Date", all = TRUE)

duplicate_columns <- duplicated(names(log_returns))
log_returns <- log_returns[, !duplicate_columns]

column_to_remove <- c("by", "all")
log_returns <- log_returns[, -which(names(log_returns) %in% column_to_remove)]

log_returns <- merge(log_returns, lupin, by = "Date", all = TRUE)

write.csv(log_returns,"log_return.csv")
