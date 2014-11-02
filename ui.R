require(shiny)
require(markdown)

shinyUI(pageWithSidebar(
  
  headerPanel("Simulating a Birth-Death Process (Queueing System)"),
  
  sidebarPanel(
    #style="min-width:235px;max-width:275px",
    selectInput('queueing_system', 'Queueing system (Q):', 
                list('M/M/k'   = 'mmk',
                     'M/M/Inf' = 'mmi',
                     'Poisson process' = 'pp')),
    numericInput('k', 'Number of servers (k):', value=1),
    numericInput('birth_rate', 'Birth rate (B):', value=1),
    numericInput('death_rate', 'Death rate (D):', value=1),
    numericInput('initial_state', 'Initial state, X(0):', value=0),
    numericInput('t', 'End time for simulation (T):', value=10),
    numericInput('n_sims', 'Number of simulations (N):', value=2)#,
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
