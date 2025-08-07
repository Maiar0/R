library(tidyverse)
library(lubridate)

logistics <- read_csv("Logistics Data/incom2024_delay_example_dataset.csv")#unpack data

logistics <- logistics %>%
  mutate(year = year(ymd_hms(order_date)))#extract year of line item

#Shipment Cost Per Region
shipment_cost_region <- logistics %>%
  group_by(order_region) %>%
  summarise(avg_shipment_cost = mean(shipment_cost, na.rm = TRUE))

ggplot(shipment_cost_region, aes(x=reorder(region,-avg_shipment_cost),y=avg_shipment_cost)) +
  geom_col(fill="steelblue") +
  labs(title= "Average Shipment Cost per Region", x = "Region", y = "Average Cost") +
  theme_minimal()


