library(shiny)
library(pez)

function(input, output) {
    output$phylo.results <- renderTable({
        # Load phylogeny
        tree <- input$phy
        if(is.null(tree))
            tree <- list(datapath="Vascular_Plants_rooted.dated.tre")
        tree <- read.tree(tree$datapath)
        # Load community data
        if(!is.null(input$comm)){
            comm <- as.matrix(read.csv(input$comm$datapath, row.names=1))
            if(input$merge==TRUE)
                output$congeneric.merge <- renderText(
                    paste("Congeneric merge details:", paste(capture.output(tree <- congeneric.merge(tree, colnames(comm))), collapse="\t\n"), collapse="\n")
                )
            c.data <- comparative.comm(tree, comm)
            output$comparative.comm <- renderText(
                paste0("Dataset details:", "\n", paste(capture.output(print(c.data)), collapse="\t\n"))
            )
            return(data.frame(.pd(c.data), MPD=.mpd(c.data), MNTD=.mntd(c.data)))
        }
    })
}
