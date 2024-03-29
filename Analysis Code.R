library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
getwd()
#setting the work directory to the below path 
setwd("/Users/jonathangabriel/Documents/Projects/GitHub Projects/Fitbit Tracking Data Analysis/FitBit Fitness Tracker Data")

#loading the data into the local tables

daily_activity_table <- read_csv("dailyActivity_merged.csv")
daily_calories_table <- read_csv("dailyCalories_merged.csv")
daily_intensities_table <- read_csv("dailyIntensities_merged.csv")
daily_steps_table <- read_csv("dailySteps_merged.csv")
daily_sleep_table <- read_csv("sleepDay_merged.csv")
seconds_heartrate_table <- read_csv("heartrate_seconds_merged.csv")
minute_mets_table <- read_csv("minuteMETsNarrow_merged.csv")
weight_log_table <- read_csv("weightLogInfo_merged.csv")

# previewing the table with the first 6 records using head function


noquote("Preview of daily_activity_table")
head(daily_activity_table)
cat("\n")

noquote("Preview of daily_calories_table")
head(daily_calories_table)
cat("\n")

noquote("Preview of daily_intensities_table")
head(daily_intensities_table)
cat("\n")

noquote("Preview of daily_steps_table")
head(daily_steps_table)
cat("\n")

noquote("Preview of daily_sleep_table")
head(daily_sleep_table)
cat("\n")

noquote("Preview of seconds_heartrate_table")
head(seconds_heartrate_table)
cat("\n")

noquote("Preview of minute_mets_table")
head(minute_mets_table)
cat("\n")

noquote("Preview of weight_log_table")
head(weight_log_table)

# cleaning data from the above tables
# to remove any duplicates if found any
daily_activity_table <- daily_activity_table[!duplicated(daily_activity_table),]
noquote("Number of duplicated rows in the daily_activity_table")
# checking the number of duplicate values should be 0 if not found
sum(duplicated(daily_activity_table))
cat("\n")

daily_calories_table <- daily_calories_table[!duplicated(daily_calories_table),]
noquote("Number of duplicated rows in the daily_calories_table")

sum(duplicated(daily_calories_table))
cat("\n")

daily_intensities_table <- daily_intensities_table[!duplicated(daily_intensities_table),]
noquote("Number of duplicated rows in the daily_intensities_table")

sum(duplicated(daily_intensities_table))
cat("\n")

daily_steps_table <- daily_steps_table[!duplicated(daily_steps_table),]
noquote("Number of duplicated rows in the daily_steps_table")

sum(duplicated(daily_steps_table))
cat("\n")

daily_sleep_table <- daily_sleep_table[!duplicated(daily_sleep_table),]
noquote("Number of duplicated rows in the daily_sleep_table")

sum(duplicated(daily_sleep_table))
cat("\n")

seconds_heartrate_table <- seconds_heartrate_table[!duplicated(seconds_heartrate_table),]
noquote("Number of duplicated rows in the seconds_heartrate_table")

sum(duplicated(seconds_heartrate_table))
cat("\n")

minute_mets_table <- minute_mets_table[!duplicated(minute_mets_table),]
noquote("Number of duplicated rows in the minute_mets_table")

sum(duplicated(minute_mets_table))
cat("\n")

weight_log_table <- weight_log_table[!duplicated(weight_log_table),]
noquote("Number of duplicated rows in the weight_log_table")

sum(duplicated(weight_log_table))

# split up date and time

updated_daily_sleep_table <- daily_sleep_table %>% 
  separate(SleepDay, c("Date", "Time"), " ")

updated_seconds_heartrate_table <- seconds_heartrate_table %>% 
  separate(Time, c("Date", "Time"), " ")

updated_minute_mets_table <- minute_mets_table %>% 
  separate(ActivityMinute, c("Date", "Time"), " ")

updated_weight_log_table <- weight_log_table %>% 
  separate(Date, c("Date", "Time"), " ")


updated_daily_activity_table <- rename(daily_activity_table, Date = ActivityDate)
updated_daily_calories_table <- rename(daily_calories_table, Date = ActivityDay)
updated_daily_intensities_table <- rename(daily_intensities_table, Date = ActivityDay)
updated_daily_steps_table <- rename(daily_steps_table, Date = ActivityDay)

library(lubridate)

updated_daily_activity_table$Date <- mdy(updated_daily_activity_table$Date)
updated_daily_calories_table$Date <- mdy(updated_daily_calories_table$Date)
updated_daily_intensities_table$Date <- mdy(updated_daily_intensities_table$Date)
updated_daily_steps_table$Date <- mdy(updated_daily_steps_table$Date)
updated_daily_sleep_table$Date <- mdy(updated_daily_sleep_table$Date)
updated_seconds_heartrate_table$Date <- mdy(updated_seconds_heartrate_table$Date)
updated_minute_mets_table$Date <- mdy(updated_minute_mets_table$Date)
updated_weight_log_table$Date <- mdy(updated_weight_log_table$Date)

ordered_daily_activity_table <- updated_daily_activity_table[
  order(updated_daily_activity_table$Date), ]

noquote("The first and last rows of the ordered_daily_activity_table are")
head(ordered_daily_activity_table, n = 1)
tail(ordered_daily_activity_table, n = 1)
cat("\n")

ordered_daily_calories_table <- updated_daily_calories_table[
  order(updated_daily_calories_table$Date), ]
noquote("The first and last rows of the ordered_daily_calories_table are")
head(ordered_daily_calories_table, n = 1)
tail(ordered_daily_calories_table, n = 1)
cat("\n")

ordered_daily_intensities_table <- updated_daily_intensities_table[
  order(updated_daily_intensities_table$Date), ]
noquote("The first and last rows of the ordered_daily_intensities_table are")
head(ordered_daily_intensities_table, n = 1)
tail(ordered_daily_intensities_table, n = 1)
cat("\n")

ordered_daily_steps_table <- updated_daily_steps_table[
  order(updated_daily_steps_table$Date), ]
noquote("The first and last rows of the ordered_daily_steps_table are")
head(ordered_daily_steps_table, n = 1)
tail(ordered_daily_steps_table, n = 1)
cat("\n")

ordered_daily_sleep_table <- updated_daily_sleep_table[
  order(updated_daily_sleep_table$Date), ]
noquote("The first and last rows of the ordered_daily_sleep_table are")
head(ordered_daily_sleep_table, n = 1)
tail(ordered_daily_sleep_table, n = 1)
cat("\n")

ordered_seconds_heartrate_table <- updated_seconds_heartrate_table[
  order(updated_seconds_heartrate_table$Date), ]
noquote("The first and last rows of the ordered_seconds_heartrate_table are")
head(ordered_seconds_heartrate_table, n = 1)
tail(ordered_seconds_heartrate_table, n = 1)
cat("\n")

ordered_minute_mets_table <- updated_minute_mets_table[
  order(updated_minute_mets_table$Date), ]
noquote("The first and last rows of the ordered_minute_mets_table are")
head(ordered_minute_mets_table, n = 1)
tail(ordered_minute_mets_table, n = 1)
cat("\n")

ordered_weight_log_table <- updated_weight_log_table[
  order(updated_weight_log_table$Date), ]
noquote("The first and last rows of the ordered_weight_log_table are")
head(ordered_weight_log_table, n = 1)
tail(ordered_weight_log_table, n = 1)


# Inconsistencies in the no of rows(checking if other tables data is missing)


noquote("Number of rows in the ordered_daily_activity_table")
nrow(ordered_daily_activity_table)
cat("\n")

noquote("Number of rows in the ordered_daily_calories_table")
nrow(ordered_daily_calories_table)
cat("\n")

noquote("Number of rows in the ordered_daily_intensities_table")
nrow(ordered_daily_intensities_table)
cat("\n")

noquote("Number of rows in the ordered_daily_steps_table")
nrow(ordered_daily_steps_table)
cat("\n")

noquote("Number of rows in the ordered_daily_sleep_table")
nrow(ordered_daily_sleep_table)
cat("\n")

noquote("Number of rows in the ordered_seconds_heartrate_table")
nrow(ordered_seconds_heartrate_table)
cat("\n")

noquote("Number of rows in the ordered_minute_mets_table")
nrow(ordered_minute_mets_table)
cat("\n")

noquote("Number of rows in the ordered_weight_log_table")
nrow(ordered_weight_log_table)

# Inconsistencies in the number of participants

noquote("Number of unique Ids in the ordered_daily_activity_table")
ordered_daily_activity_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_daily_calories_table")
ordered_daily_calories_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_daily_intensities_table")
ordered_daily_intensities_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_daily_steps_table")
ordered_daily_steps_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_daily_sleep_table")
ordered_daily_sleep_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_seconds_heartrate_table")
ordered_seconds_heartrate_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_minute_mets_table")
ordered_minute_mets_table$Id %>% n_distinct()
cat("\n")

noquote("Number of unique Ids in the ordered_weight_log_table")
ordered_weight_log_table$Id %>% n_distinct()

# checking if there exists any null values

is.null(ordered_daily_activity_table)
is.null(ordered_daily_calories_table)
is.null(ordered_daily_intensities_table)
is.null(ordered_daily_steps_table)
is.null(ordered_daily_sleep_table)
is.null(ordered_seconds_heartrate_table)
is.null(ordered_minute_mets_table)
is.null(ordered_weight_log_table)

# checking for missing values

noquote("Number of missing values in the ordered_daily_activity_table")
sum(is.na(ordered_daily_activity_table))
cat("\n")

noquote("Number of missing values in the ordered_daily_calories_table")
sum(is.na(ordered_daily_calories_table))
cat("\n")

noquote("Number of missing values in the ordered_daily_intensities_table")
sum(is.na(ordered_daily_intensities_table))
cat("\n")

noquote("Number of missing values in the ordered_daily_steps_table")
sum(is.na(ordered_daily_steps_table))
cat("\n")

noquote("Number of missing values in the ordered_daily_sleep_table")
sum(is.na(ordered_daily_sleep_table))
cat("\n")

noquote("Number of missing values in the ordered_seconds_heartrate_table")
sum(is.na(ordered_seconds_heartrate_table))
cat("\n")

noquote("Number of missing values in the ordered_minute_mets_table")
sum(is.na(ordered_minute_mets_table))
cat("\n")

noquote("Number of missing values in the ordered_weight_log_table")
sum(is.na(ordered_weight_log_table))

# listing missing values count for the weight log table

is.na(ordered_weight_log_table)

# removing the missing values from fat column

ordered_weight_log_table %>% 
  filter(!is.na(Fat))

# removing the fat column table as there are very few records corresponding to person body fat data

trimmed_weight_log_table <- subset(ordered_weight_log_table, select = -Fat)
cat("\n")

noquote("Number of missing values in the trimmed ordered_weight_log_table")
sum(is.na(trimmed_weight_log_table))

# checking incorrect entries in data if found any 

sorted_minute_mets_table <- ordered_minute_mets_table[order(ordered_minute_mets_table$METs), ]
head(sorted_minute_mets_table, n=20)

sorted_minute_mets_table <- ordered_minute_mets_table[order(ordered_minute_mets_table$METs), ]
tail(sorted_minute_mets_table, n=20)

sorted_seconds_heartrate_table <- ordered_seconds_heartrate_table[order(ordered_seconds_heartrate_table$Value), ]
head(sorted_seconds_heartrate_table, n=20)

# summary of all the tables

sapply(list(ordered_daily_activity_table, ordered_daily_calories_table, ordered_daily_intensities_table,
            ordered_daily_steps_table, ordered_daily_sleep_table, ordered_seconds_heartrate_table,
            ordered_minute_mets_table, trimmed_weight_log_table), summary)
# comparing weekday vs a weekend activity

weekday_daily_activity_table <- ordered_daily_activity_table

weekday_daily_activity_table$weekday <- weekdays(ordered_daily_activity_table$Date)

aggregate_steps_daily_activity_table <- aggregate(TotalSteps ~ weekday , weekday_daily_activity_table, mean)

aggregate_steps_daily_activity_table$weekday <- ordered(aggregate_steps_daily_activity_table$weekday, 
                                                        levels=c("Monday", "Tuesday", "Wednesday", "Thursday", 
                                                                 "Friday", "Saturday", "Sunday"))

ggplot(aggregate_steps_daily_activity_table, aes(x=weekday, y=TotalSteps)) + 
  geom_bar(stat="identity", fill="steelblue") + 
  geom_text(aes(label=round(TotalSteps, digits=0)), vjust=1.6, color="white", size=5.5) + 
  labs(title="Total Steps Walked On Average Each Day", x="Day", y="Number of Steps") +
  theme(plot.title = element_text(hjust = 0.5, size=20), axis.text=element_text(size=10),
        axis.title=element_text(size=14), 
        axis.title.y=element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
        axis.title.x=element_text(margin = margin(t = 15, r = 0, b = 0, l = 0)))

weekday_daily_activity_table <- weekday_daily_activity_table %>% 
  mutate(weekday_integer=as.numeric(weekday_daily_activity_table$weekday <- 
                                      factor(weekday_daily_activity_table$weekday, levels = 
                                               c("Monday", "Tuesday", "Wednesday",
                                                 "Thursday", "Friday", "Saturday", "Sunday"),
                                             ordered = TRUE)))

glimpse(weekday_daily_activity_table)

cor.test(weekday_daily_activity_table$TotalSteps, weekday_daily_activity_table$weekday_integer, 
         method="spearman")


#theme_set(theme_bw())  
ggplot(weekday_daily_activity_table, aes(TotalSteps, Calories)) +
  geom_jitter(width = .5, size=1) +
  geom_smooth(method="loess", se=T, level=0.95) +
  labs(x="Total Number of Steps Walked Daily", y="Calories Burnt Daily",
       title="Relation Between Calories and Total Steps Walked") +
  theme(plot.title = element_text(hjust = 0.5, size=18), axis.text=element_text(size=10),
        axis.title=element_text(size=14), 
        axis.title.y=element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
        axis.title.x=element_text(margin = margin(t = 15, r = 0, b = 0, l = 0)))

updated_ordered_daily_sleep_table <- ordered_daily_sleep_table %>% mutate(time_taken_to_sleep=TotalTimeInBed-TotalMinutesAsleep)

ggplot(updated_ordered_daily_sleep_table, aes(x = time_taken_to_sleep)) +
  geom_area(stat = "bin", bins = 30) +
  labs(x="Time Taken to Sleep (mins)", y="Number of Occurences",
       title="Time Taken to Sleep by Respondents") +
  theme(plot.title = element_text(hjust = 0.5, size=18), axis.text=element_text(size=10),
        axis.title=element_text(size=14), 
        axis.title.y=element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
        axis.title.x=element_text(margin = margin(t = 15, r = 0, b = 0, l = 0)))


ggplot(ordered_daily_sleep_table, aes(TotalTimeInBed, TotalMinutesAsleep)) +
  geom_jitter(width = .5, size=1) +
  geom_smooth(method="loess", se=T, level=0.95) +
  labs(x="Total Time in Bed (mins)", y="Total Time Asleep (mins)",
       title="Relation Between Time Asleep and Time in Bed") +
  theme(plot.title = element_text(hjust = 0.5, size=18), axis.text=element_text(size=10),
        axis.title=element_text(size=14), 
        axis.title.y=element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
        axis.title.x=element_text(margin = margin(t = 15, r = 0, b = 0, l = 0))) 

write.csv(ordered_seconds_heartrate_table, "ordered_seconds_heartrate_table.csv", row.names = F)
write.csv(ordered_daily_activity_table, "ordered_daily_activity_table.csv", row.names = F)



sorted_weight_log_table <- trimmed_weight_log_table[order(trimmed_weight_log_table$BMI), ] 
underweight_respondents <- sorted_weight_log_table %>% filter(BMI < 18.5)
overweight_respondents <- sorted_weight_log_table %>% filter(BMI > 24.9)
obese_respondents <- sorted_weight_log_table %>% filter(BMI > 30)


noquote("Total number of respondents")
cat("\n")
length(unique(sorted_weight_log_table$Id))
cat("\n")

noquote("Number of underweight respondents")
cat("\n")
length(unique(underweight_respondents$Id))
cat("\n")


noquote("Number of overweight respondents")
cat("\n")
length(unique(overweight_respondents$Id))
cat("\n")


noquote("Number of obese respondents")
cat("\n")
length(unique(obese_respondents$Id))
cat("\n")

filtered_heart_rate <- ordered_seconds_heartrate_table %>% 
  filter(Value <= 60)

ggplot(filtered_heart_rate) +
  geom_line(mapping = aes(x = Date, y = count)) +
  labs(x="Date", y="Number of Occurences",
       title= "No of Occurences where heart rate <= 60 BPM accross the respondents each day") +
  facet_wrap(~Id)
theme(plot.title = element_text(hjust = 0.5, size=18), axis.text=element_text(size=10),
      axis.title=element_text(size=14), 
      axis.title.y=element_text(margin = margin(t = 0, r = 15, b = 0, l = 0)),
      axis.title.x=element_text(margin = margin(t = 15, r = 0, b = 0, l = 0)))
ggsave("number of occurences.jpeg")
