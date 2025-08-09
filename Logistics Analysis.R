library(tidyverse)
library(lubridate)

logistics <- read_csv("Logistics Data/incom2024_delay_example_dataset.csv")#unpack data

logistics <- logistics %>%
  mutate(year = year(ymd_hms(order_date)))#extract year of line item

#profit ratio per region
profit_per_region <- logistics %>%
  group_by(order_region) %>%
  summarise(avg_profit_ratio = mean(order_item_profit_ratio, na.rm = TRUE))

ggplot(profit_per_region, aes(x=reorder(order_region,-avg_profit_ratio),y=avg_profit_ratio)) +
  geom_col(fill="steelblue") +
  labs(title= "Average Profit per Region Ratio", x = "Region", y = "Average Profit Ratio") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))


