#### PACKAGES ####
library(tidyverse)
library(dplyr)


#### NORWAY - Parents age before VS now ####
ParentsAgeNorway <- read_excel("~/Desktop/ParentsAgeNorway.xlsx")
View(ParentsAgeNorway)
str(ParentsAgeNorway)

colnames(ParentsAgeNorway) <- c("Year",
                                "MotherAge",
                                "FatherAge",
                                "YearGap")

ParentsAgeNorway <- as.numeric(ParentsAgeNorway)
str(ParentsAgeNorway)
ParentsAgeNorway$Year <- as.numeric(ParentsAgeNorway$Year)
str(ParentsAgeNorway)

ggplot(ParentsAgeNorway, aes(x = Year)) +
  geom_line(aes(y = MotherAge), color = "red") +
  geom_line(aes(y = FatherAge), color = "blue") +
  xlab("Year") +
  ylab("Age")

#### NORWAY - Education ####
Grunnskole <- read_excel("~/Downloads/Grunnskole.xlsx")
Videregaaende <- read_excel("~/Downloads/Videregaaende.xlsx")
Hoyereutd_kort <- read_excel("~/Downloads/Hoyereutd.kort.xlsx")
HoyereUtd_lang <- read_excel("~/Downloads/HoyereUtd.lang.xlsx")

colnames(Grunnskole) <- c("Year", "Elementary")
colnames(Videregaaende) <- c("Year", "Secondary")
colnames(Hoyereutd_kort) <- c("Year", "HigherEduShort")
colnames(HoyereUtd_lang) <- c("Year", "HigherEduLong")

EducationNorway <- Grunnskole %>%
  add_column(Videregaaende$Secondary,
             Hoyereutd_kort$HigherEduShort,
             HoyereUtd_lang$HigherEduLong)

view(EducationNorway)

colnames(EducationNorway) <- c("Year",
                               "Elementary",
                               "Secondary",
                               "HigherEduShort",
                               "HigherEduLong")
view(EducationNorway)
str(EducationNorway)

EducationNorway$Year <- as.numeric(EducationNorway$Year)
class(EducationNorway$Year)

ggplot(EducationNorway, aes(x = Year)) +
  geom_line(aes(y = Elementary), color = "green") +
  geom_line(aes(y = Secondary), color = "blue") +
  geom_line(aes(y = HigherEduShort), color = "red") +
  geom_line(aes(y = HigherEduLong), color = "purple") + 
  xlab("Year") +
  ylab("Population")

#### DENMARK - Parents age beofre VS now ####
ParentsAgeDenmark <- read_excel("~/Downloads/ParentsAgeDenmark.xlsx")
view(ParentsAgeDenmark)

colnames(ParentsAgeDenmark) <- c("Year", "MotherAge", "FatherAge")
view(ParentsAgeDenmark)

str(ParentsAgeDenmark)
ParentsAgeDenmark$Year <- as.numeric(ParentsAgeDenmark$Year)
class(ParentsAgeDenmark$Year)

ggplot(ParentsAgeDenmark, aes(x = Year)) +
  geom_line(aes(y = MotherAge), color = "red") +
  geom_line(aes(y = FatherAge), color = "blue") +
  xlab("Year") +
  ylab("Age")

ParentsAgeDenmark <- ParentsAgeDenmark %>%
  mutate("YearGap" = (FatherAge - MotherAge))
view(ParentsAgeDenmark)


#### DENMARK - Education ####
EducationDenmark <- read_excel("~/Downloads/EducationDenmark.xlsx")
View(EducationDenmark)

colnames(EducationDenmark) <-c("Year",
                               "Elementary", 
                               "Secondary", 
                               "VocationalEducation", 
                               "ShortCycleHigherEducation", 
                               "VocationalBachelorEducation",
                               "Bachelor",
                               "Master",
                               "PhD")

view(EducationDenmark)

str(EducationDenmark)
EducationDenmark$Year <- as.numeric(EducationDenmark$Year)
class(EducationDenmark$Year)


ggplot(EducationDenmark, aes(x = Year)) +
  geom_line(aes(y = Secondary), color = "blue") +
  geom_line(aes(y = ShortCycleHigherEducation), color = "pink") +
  geom_line(aes(y = Bachelor), color = "red") +
  geom_line(aes(y = Master), color = "purple") +
  geom_line(aes(y = PhD), color = "brown") +
  xlab("Year") +
  ylab("Population")


ggplot(EducationDenmark, aes(x = Year)) +
  geom_line(aes(y = Elementary), color = "green") +
  geom_line(aes(y =VocationalEducation), color = "dark blue") +
  xlab("Year") +
  ylab("Population")
  

#### NORWAY - GDP per capita ####
NorGDPperCap <- read.csv("~/Downloads/NorGDPperCap.csv")
View(NorGDPperCap)

colnames(NorGDPperCap) <- c("Year", "GDPperCapUSd", "AnnualGrowthR")

str(NorGDPperCap)
NorGDPperCap$Year <- as.numeric(NorGDPperCap$Year)
class(NorGDPperCap$Year)
view(NorGDPperCap)

ggplot(NorGDPperCap, aes( x = Year)) + 
  geom_line(aes(y = GDPperCapUSd), color = "red") +
  xlab("Year") +
  ylab("GDP per Capita in US dollars")

ggplot(NorGDPperCap, aes( x = Year)) + 
  geom_line(aes(y = AnnualGrowthR), color = "blue") +
  xlab("Year") +
  ylab("Annual Growth Rate")

#### NORWAY - life expectancy for women ####
LifeExpectWomNorway <- read_excel("~/Downloads/LifeExpectWomNorway.xlsx")
View(LifeExpectWomNorway)      

colnames(LifeExpectWomNorway) <- c("Year", "LifeExpWomen")
view(LifeExpectWomNorway)

str(LifeExpectWomNorway)
LifeExpectWomNorway$Year <- as.numeric(LifeExpectWomNorway$Year)
class(LifeExpectWomNorway$Year)

ggplot(LifeExpectWomNorway, aes(x = Year, y = LifeExpWomen)) + 
  geom_line() +
  ylab("Life Expectancy for Women in Norway")
