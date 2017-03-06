library(shiny)
library(pez)

function(input, output) {
    output$contents <- renderTable({
        # Load phylogeny
        tree <- input$phy
        if(is.null(tree))
            tree <- list(datapath="Vascular_Plants_rooted.dated.tre")
        tree <- read.tree(tree$datapath)
        # Load community data
        if(!is.null(input$comm)){
            comm <- as.matrix(read.csv(input$comm$datapath, row.names=1))
            if(input$merge==TRUE)
                tree <- congeneric.merge(tree, colnames(comm))
            c.data <- comparative.comm(tree, comm)
            return(.pd(c.data))
        }
    })
}
