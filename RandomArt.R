#This is a package to create random art.
#Fleur Korzilius
#   http://r-pkgs.had.co.nz/

library(ggplot2)

set.seed()

x <- sample(100)
y <- sample(100)
df_art <- data.frame(x,y)

art <- ggplot(df_art, aes(x, y)) +
  geom_point(aes(color = y))
art + theme(axis.title = element_blank()) +
  theme(legend.position = "none",
        panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()) +
  stat_density_2d_filled(aes(fill = ..level..), geom="polygon") +
  scale_fill_gradient(low = palette1)

colors1 <- sample(1)
palette1 <- rainbow(colors1)

make_art <- function(seed = NA) {
  if (!is.na(seed)) {
    set.seed(seed)
  }
  x <- sample(1000)
  y <- rnorm(100)
  df_art <- data.frame(x,y)

  art <- ggplot(df_art, aes(x, y)) +
    geom_point(aes(color = y))
  art + theme(axis.title = element_blank()) +
    theme(legend.position = "none",
          panel.background = element_blank(),
          axis.text = element_blank(),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_blank()) +
    stat_density_2d_filled(aes(fill = ..level..), geom="polygon")
}
make_art()



