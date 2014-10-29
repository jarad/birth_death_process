require(shiny)
require(markdown)

shinyUI(pageWithSidebar(
  
  headerPanel("Simulating a Poisson Process"),
  
  sidebarPanel(
    #style="min-width:235px;max-width:275px",
    selectInput('queueing_system', 'Queueing System (Q)', 
                list('M/M/Inf' = 'mmi')),
    numericInput('birth_rate', 'Birth Rate (B)', value=1),
    numericInput('death_rate', 'Death Rate (D)', value=1),
    numericInput('t', 'End time for simulation (T)', value=10),
    numericInput('n_sims', 'Number of simulations (N)', value=2)#,
    #submitButton('Simulate.')
  ),
    
  mainPanel(
    tabsetPanel(
      tabPanel('Simulations',          plotOutput('simulation')),
#       tabPanel('Birth times', 
#                checkboxInput('combine_birth_times', 'Combine birth times across simulations?', value=FALSE),
#                plotOutput('interarrival')),
#       tabPanel('Death times', 
#                checkboxInput('combine_death_times', 'Combine death times across simulations?', value=FALSE),
#                plotOutput('interarrival')),
      tabPanel('Help', includeMarkdown('help.md'))
    )
  )
))
