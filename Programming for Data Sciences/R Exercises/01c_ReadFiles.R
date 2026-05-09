########################################################################
# Reading excel,csv, database files, json
########################################################################
#install.packages("readxl")
# version command  to know the version of R


library(readxl)
tips = read_excel("C:/Rekha/02 Study/RPrograms/InputFiles/tips.xls")
View(tips)

tips = read.csv("C:/Rekha/02 Study/RPrograms/InputFiles/tips.csv")
View(tips)



#install.packages("RSQLite")

library("RSQLite")


irisdb = "C:/Rekha/02 Study/RPrograms/InputFiles/database.sqlite"
con <- dbConnect(drv=RSQLite::SQLite(), dbname=irisdb)

## list all tables
tables = dbListTables(con)
res = dbSendQuery(con, "SELECT * from Iris")
data = fetch(res, n = 2)
data

#query
qry = "SELECT * FROM Iris
WHERE Species LIKE '%or%'"

res = dbSendQuery(con, qry)
data = fetch(res,n = 2)
data

### Json

# install.packages("rjson")  

library("rjson")
jsonfile = "C:/Rekha/02 Study/RPrograms/InputFiles/ex_json.json"
result = fromJSON(file = jsonfile)  
#converting to a dataframe
data_frame = as.data.frame(result)  

View(data_frame)

# xml files

install.packages("XML")  

library("XML")
xmlfile = "C:/Rekha/02 Study/RPrograms/InputFiles/ex_xml.xml"
result = xmlParse(file = xmlfile)  

xml_data = xmlToList(result)  
print(xml_data)  



