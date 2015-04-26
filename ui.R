library(shiny)

shinyUI( 
        pageWithSidebar(
                # Coursera Data Science - John Hopkins Bloomberg School of Public health
                headerPanel("Non Transitive Dice - Roger Oglesby"),
                sidebarPanel(
                        h4('You must pick between three dice - Die A, Die B or Die C.'),
                        h4('After you pick a die, I will pick one of the remaining dice.'),
                        h4('We will then simulate 1,000 rolls of the dice 
                           - the highest score on each roll gains a point.'),
                        h4('The person with the most points at the end is the winner.'),
                        h3('You get first choice of the dice, but can you pick a winner?'),
                        h4('Die A : 3, 3, 3, 3, 3, 6'),
                        h4('Die B : 2, 2, 2, 5, 5, 5'),
                        h4('Die C : 1, 4, 4, 4, 4, 4'),
                        selectInput("pick", label = h5("Which die would you like?"), 
                                    choices = list("Die A = mostly 3s" = 1, 
                                                   "Die B = 2s and 5s" = 2,
                                                   "Die C = mostly 4s" = 3),
                                    selected = 1),
                        submitButton('Submit')
                ),
                # Output section
                # Confirm the input choice and the result of that choice
                # Draw a graph of the game
                mainPanel(
                        h3('Results of simulation'),
                        h4('You selected '),
                        verbatimTextOutput("mess"),
                        h4('Which resulted in this game...'),
                        plotOutput("randPlot"),
                        h3('Would you like to pick again for another game?')
                )
        )
)
