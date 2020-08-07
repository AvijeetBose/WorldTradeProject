#install libraries
library(dplyr)


#load the dataset
WorldTradeRecord <- read.csv("D:/R-Code/Project/Raw data.csv")


#Create duplicate
TradeBusinessWorldwide <- WorldTradeRecord

#Update Column Name
names(TradeBusinessWorldwide) <- c("CountryName", "Year", "Commoditycode", "Commodity", "Flow",
                     "DollarValue", "Weight", "QtyName", "Qty", "Category")


#summary of data
summary(TradeBusinessWorldwide) 

#Missing values present in Weight and Quantity either 0 or NA

#When Weight is 0 or NA, or Quantity is 0 or NA - then assign 1
TradeBusinessWorldwide$MissingData <- ifelse(TradeBusinessWorldwide$Weight < 1 | is.na(TradeBusinessWorldwide$Weight) 
                           | TradeBusinessWorldwide$Qty < 1 | is.na(TradeBusinessWorldwide$Qty), "1", "0")
table(TradeBusinessWorldwide$MissingData)


#Filter Record with non Zero Values
Cleaned_Data<-filter(TradeBusinessWorldwide,MissingData==0)
summary(Cleaned_Data)

#Drop Col "MissingData"
Cleaned_Data$MissingData<-NULL
summary(Cleaned_Data)
#Write the data into csv to use in Tableau
write.csv(Cleaned_Data, "D:/R-Code/Project/Cleaned data.csv",row.names = FALSE)