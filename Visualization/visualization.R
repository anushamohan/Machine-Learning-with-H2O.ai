# Ref :http://shiny.stat.ubc.ca/r-graph-catalog/#fig02-02_structured-data-set-dot-plot

setwd("/home/anusha/cscie-63/project")
df = read.csv ( "results.csv" , header = TRUE , sep = ",")
print(df)


library(ggplot2)

this_base <- "Family-Top1 Senstivity of Protein fold recognition methods"
filename1 = "Family_Top1"

my_data <- data.frame(  variable = df$Method,
  value = df$Family_Top1)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename1, ".png"), 
       p, width = 8, height = 4)

#######

this_base <- "Family-Top5 Senstivity of Protein fold recognition methods"
filename2 = "Family_Top5"

my_data <- data.frame(  variable = df$Method,
                        value = df$Family_Top5)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename2, ".png"), 
       p, width = 8, height = 4)

#######

this_base <- "SuperFamily-Top1 Senstivity of Protein fold recognition methods"
filename3 = "SuperFamily_Top1"

my_data <- data.frame(  variable = df$Method,
                        value = df$Superfamily_Top1)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename3, ".png"), 
       p, width = 8, height = 4)

#######

this_base <- "SuperFamily-Top5 Senstivity of Protein fold recognition methods"
filename4 = "SuperFamily_Top5"

my_data <- data.frame(  variable = df$Method,
                        value = df$Superfamily_Top5)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename4, ".png"), 
       p, width = 8, height = 4)

#######

this_base <- "Fold-Top1 Senstivity of Protein fold recognition methods"
filename5 = "Fold_Top1"

my_data <- data.frame(  variable = df$Method,
                        value = df$Fold_Top1)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename5, ".png"), 
       p, width = 8, height = 4)


####

this_base <- "Fold-Top5 Senstivity of Protein fold recognition methods"
filename6 = "Fold_Top5"

my_data <- data.frame(  variable = df$Method,
                        value = df$Fold_Top5)

p <- ggplot(my_data, aes(x = value, y = variable)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = seq(0, 100, 10), limits = c(0, 100)) +
  ggtitle(this_base) +
  theme_bw() +
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line(colour = "grey50",
                                          linetype = "solid"),
        plot.title = element_text(size = rel(1.2), face = "bold", vjust = 1.5),
        axis.title = element_blank())

p

ggsave(paste0(filename6, ".png"), 
       p, width = 8, height = 4)