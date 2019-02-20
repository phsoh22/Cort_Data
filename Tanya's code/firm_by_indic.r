# Let's use the 'flare dataset' (stored in the ggraph library)
install.packages('ggraph')
install.packages("data.tree")
        # devtools::install_github("jeromefroe/circlepackeR")
install.packages('devtools')
devtools::install_github("jeromefroe/circlepackeR")

myDataf = read.csv("/home/tatyana/market_analysis/firm_by_illnes_2.csv")
length(unique(myDataf$to))
data_edge = rbind(data_edge_init,uniq)
data_edge$from <- NULL
data_edge <- data_edge[, c(2,1)]
# This is an edge list

# We need to convert it to a nested data frame. the data.tree library is our best friend for that:
library(data.tree)
data_tree <- FromDataFrameNetwork(data_edge)
data_nested=ToDataFrameTree(data_tree, 
                            level1 = function(x) x$path[2],
                            level2 = function(x) x$path[3])[-1,-1]
data_nested=na.omit(data_nested)

# Now we can plot it as seen before!
data_nested$pathString <- paste("roots", data_nested$level1, data_nested$level2, sep = "/")
data_nested$value=1
data_Node <- as.Node(data_nested)
circlepackeR(data_Node, size = "value")

