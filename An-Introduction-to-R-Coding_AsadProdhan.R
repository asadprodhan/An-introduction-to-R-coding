# An Introduction to R Coding by Dr Asad Prodhan (E-mail: asad.prodhan@uwa.edu.au or prodhan82@gmail.com)
# Install R packages
install.packages("ggplot2")
install.packages("tinytex")

# Upload the installed R packages

library(ggplot2)
library(tinytex)

# Upload your data

df <- read.csv('npdat6.csv') # we name our data-set as 'df'
head(df)

# Make the graph

g <- ggplot(df) +                              
  geom_boxplot(aes(x=factor1, y=global.leaf.n))
                                               
g	

# How are the above codes working?
# 'ggplot2' is accessing our data
# 'geom_boxplot' is making a boxplot using our data
# 'factor1' is the trait on the X-axis
# 'global.leaf.n' is the trait on the Y-axis

# We can make the graph colorful

g <- ggplot(df) +
  geom_boxplot(aes(x=factor1, y=global.leaf.n),
               width=0.80, # we changed the width of the boxes
               outlier.colour = "black", # we changed the outlier colour
               outlier.shape = 8, # we changed the outlier shape
               outlier.size = 1, # we changed the outlier size
               fill="forestgreen", # we changed the box colour
               lwd=0.6) # we changed the box lines' width
g

# We can edit the axis labels

g <- ggplot(df) +
  geom_boxplot(aes(x=factor1, y=global.leaf.n),
               width=0.80,
               outlier.colour = "black",
               outlier.shape = 8,
               outlier.size = 1,
               fill="forestgreen",
               lwd=0.6)+
  scale_x_discrete(labels=c("A.Tree"="Tree","B.Shrub"="Shrub","C.Herb"="Herb", 
                            "D.Grass"="Grass","E.Conifer"="Conifer",
                            "F.Liana"="Liana"))+ # X-axis label
  scale_y_continuous(breaks=seq(0, 60, 10))+ # Y-axis scale changed
  ylab(expression('Leaf Nitrogen'~~(mg~g^-1~DW)))+ # Y-axis label changed
  xlab('Groups') # X-axis label changed
g

# We can change the background, make the labels bold, and add extra information (a horizontal line in this example) 

g <- ggplot(df) +
  geom_boxplot(aes(x=factor1, y=global.leaf.n),
               width=0.80,
               outlier.colour = "black",
               outlier.shape = 8,
               outlier.size = 1,
               fill="forestgreen",
               lwd=0.6)+
  scale_x_discrete(labels=c("A.Tree"="Tree","B.Shrub"="Shrub","C.Herb"="Herb", 
                            "D.Grass"="Grass","E.Conifer"="Conifer",
                            "F.Liana"="Liana"))+
  scale_y_continuous(breaks=seq(0, 60, 10))+ 
  ylab(expression('Leaf Nitrogen'~~(mg~g^-1~DW)))+ 
  xlab('Groups')+ 
  geom_hline(yintercept=12.7, col = "red", lty = 5, lwd = 1.2)+ 
  # a red horizontal line
  theme_bw()+ # background colour changed
  theme(axis.text.x=element_text(color = 'black', size=11, face='bold'), 
        # X-axis text changed
        axis.title.x=element_text(color='black', size=11, face='bold', 
                                  vjust =-0.35), # X-axis title changed
        axis.text.y=element_text(color = 'black', size=11, 
                                 face='bold'), # Y-axis text changed
        axis.title.y=element_text(color='black', size=11, 
                                  face='bold', vjust =1.5), 
        # Y-axis title changed
        panel.grid.major = element_blank(), # background major grid removed
        panel.grid.minor = element_blank(), # background minor grid removed 
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black")) 
# background panel axis changed
g

# We can give a name to our graph
global.leaf.n <- g # we named our box-plot as 'global.leaf.n'

# We can save our graph
ggsave("global.leaf.n.png", global.leaf.n, height = 9, width = 13, dpi = 300, units='cm')

# we can change size and resolution of the plot


## Congratulations!
## We just learned how to code using R.
## We can use this R script as a template and modify it to make different graphs 
