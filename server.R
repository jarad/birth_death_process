library(shiny)
library(plyr)
library(scales)
library(ggplot2)

shinyServer(function(input,output) {
  d <- reactive({
    B = input$birth_rate
    D = input$death_rate
    o = rdply(input$n_sims, {
      t = tt = 0
      X = Xt = 0
      while(t < input$t) {
        t = t + rexp(1, B + D * X)
        X = X+sample(c(-1,1), 1, prob = c(D * X, B)/(B + D * X))
        tt = c(tt,t)
        Xt = c(Xt,X)
      }
      data.frame(time=tt, state=Xt)
    })
    o$Simulation = factor(o$.n)
    o
  })
  
  output$simulation <- renderPlot({
    g = ggplot(d(), aes(x=time, y=state, color=Simulation)) + 
      geom_step() +
      scale_x_continuous(name="Time", breaks=pretty_breaks(), limits=c(0,input$t)) + 
      scale_y_continuous(name="Current state", breaks=pretty_breaks())
    print(g)
  })
})
