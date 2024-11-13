# SOK-1004 Produktivitet eksempel

# Plotte gjennomsnitt for noen tidsperioder

# rydde og last inn pakker

rm(list=ls())
library(tidyverse)

# Lag data (NB oppdiktet data)
df <- data.frame(
  år = 1996:2023,
  prod_vekst = c(4.1, 5.0, 2.2, 3.9, 7.1, 3.8, -2.5, 3.6, 2.2, 3.7,
                   4.2, 3.4, 1.1, 1.8, -1.3, 1.3, 3.5, 4.8, 0.7, 1.2,
                   1.3, 0.6, -1.0, 0.4, 1.1, -2.5, 0.5, -2.3)
)



# lag datasett med gjennomsnittsverdier
# du kan lage egne perioder

gjenn_prod_data <- tribble(
  ~periode, ~start_år, ~slutt_år,
  "1996-2005", 1996, 2005,
  "2006-2011", 2006, 2011,
  "2006-2023", 2006, 2023
) %>%
  rowwise() %>%
  mutate(gj_produktivitet = mean(df$prod_vekst[df$år %in% start_år:slutt_år]))




# Plott

df %>% 
  ggplot(aes(x = år, y = prod_vekst)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_segment(data = gjenn_prod_data, aes(x = start_år, xend = slutt_år, 
                                                y = gj_produktivitet, yend = gj_produktivitet), 
               color = "black", size = 1) +
  labs(title = "Eksempel med oppdiktet data",
       x = "År", y = "Prosentvis endring") +
  theme_minimal()
