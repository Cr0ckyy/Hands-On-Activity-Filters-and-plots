# Read in the hotel bookings data from a csv file
hotel_bookings <- read.csv("hotel_bookings.csv")

# View the first few rows of the data
head(hotel_bookings)

# View the names of the columns in the data
colnames(hotel_bookings)

# Install the ggplot2 package for data visualization
install.packages('ggplot2')

# Load the ggplot2 library for data visualization
library(ggplot2)

# Create a scatterplot showing the relationship between lead time and number of children
ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Create a bar chart showing the distribution of hotels by market segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel, fill = market_segment))

# Create a bar chart showing the distribution of hotels by market segment, with separate plots for each market segment
ggplot(data = hotel_bookings) +
  geom_bar(mapping = aes(x = hotel)) +
  facet_wrap(~market_segment)

# Install the tidyverse package for data manipulation
install.packages('tidyverse')

# Load the tidyverse library for data manipulation
library(tidyverse)

# Filter the hotel bookings data to only include City Hotels with a market segment of "Online TA"
onlineta_city_hotels <- filter(hotel_bookings,
                               (hotel == "City Hotel" &
                                 hotel_bookings$market_segment == "Online TA"))

# View the filtered data in a new window
View(onlineta_city_hotels)

# Use the pipe operator (%>%) to filter the hotel bookings data to only include City Hotels with a market segment of "Online TA"
onlineta_city_hotels_v2 <- hotel_bookings %>%
  filter(hotel == "City Hotel") %>%
  filter(market_segment == "Online TA")

# View the filtered data in a new window
View(onlineta_city_hotels_v2)

# Create a scatterplot showing the relationship between lead time and number of children, using the filtered data
ggplot(data = onlineta_city_hotels) +
  geom_point(mapping = aes(x = lead_time, y = children))

# Retrieve the lead time of the first row
lead_time_first_row <- onlineta_city_hotels_v2$lead_time[1]

# Print the lead time
print(lead_time_first_row)


