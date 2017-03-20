library(shiny)

fluidPage(
    titlePanel("Uploading Files"),
    sidebarLayout(
        sidebarPanel(
            fileInput('phy', 'Choose Phylogeny (Optional; Newick)', accept=c('.tre','.phy')),
            fileInput('comm', 'Choose Community File (CSV)', accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
            checkboxInput("merge", "(Optional) Run congeneric.merge?", value=FALSE),
            tags$hr(),
            h1("How to use this app"),
            p("1. Optional: If you're not working with plants, upload a phylogeny in Newick format (first button above). Otherwise, do nothing."),
            tags$a(href="https://github.com/willpearse/pd_app/raw/master/test.tre", "For an example of Newick format, click here!"),
            p("2. Optional: If your phylogeny doesn't contain all of the species in your sites, that's OK. Check the 'congeneric.merge' button to merge in congeneric replacements. This assumes that your species names are 'genus_species'; otherwise this will break."),
            tags$a(href="https://github.com/willpearse/pd_app/raw/master/test.csv", "For an example of the species/site format, click here!"),
            p("3. Upload your species/site information as a CSV file (second button above). Species should be columns, sites should be rows."),
            p("Once you've done this, there will be a slight delay, and then PD and abundance-corrected PD will be calcualted in the panel to the right."),
            p("To cite this, just cite the pez package: Pearse, W. D., Cadotte, M. W., Cavender-Bares, J., Ives, A. R., Tucker, C. M., Walker, S. C., & Helmus, M. R. (2015). pez: phylogenetics for the environmental sciences. Bioinformatics, 31(17), 2888-2890. If you didn't upload a phylogeny in step 1, cite this paper as the source: Zanne, A. E., Tank, D. C., Cornwell, W. K., Eastman, J. M., Smith, S. A., FitzJohn, R. G., ... & Royer, D. L. (2014). Three keys to the radiation of angiosperms into freezing environments. Nature, 506(7486), 89-92. You should cite the original Dan Faith PD reference as well: Faith, D. P. (1992). Conservation evaluation and phylogenetic diversity. Biological conservation, 61(1), 1-10.")
        ),
        mainPanel(
            verbatimTextOutput('congeneric.merge'),
            tags$hr(),
            verbatimTextOutput('comparative.comm'),
            tags$hr(),
            tableOutput('phylo.results')
        )
    )
)
