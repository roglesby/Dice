library(shiny)
library(ggplot2)
# Initialise with a seed for repeatability
# set.seed(10)
# Initialise the transitive dice
A <- c(3,3,3,3,3,6)
B <- c(2,2,2,5,5,5)
C <- c(1,4,4,4,4,4)
# Die 1(A) is better than 2(B)
# Die 2(B) is better than 3(C)
# Die 3(C) is better than 1(A)
mypick <- c(3,1,2)
dice  <- cbind(A,B,C)
dicename <- c("Die A","Die B","Die C")
sample  <- 1000
# The output of the game is a graph of the score
gameplot <- function(g) {
        g2 = ggplot(g) 
        g2 = g2 + geom_point(aes(x=roll, y=score)) 
        g2 = g2 + geom_line(aes(x = roll, y = score))
        g2 = g2 + xlab("A positive score means I am winning") 
        g2 = g2 + ylab("Score" )
        g2 = g2 + geom_abline(intercept = 0, slope = 0, size = 1, colour = "black")
        g2 = g2 + geom_text(x = 50, y = 20, label="I win by ", angle = 0, size = 8, colour = "red")
        g2 = g2 + geom_text(x = 200, y = 20, label=g$score[sample], angle = 0, size = 8, colour = "red")
        g2 = g2 + theme(axis.title.x = element_text(size = 20))
        g2 = g2 + theme(axis.text = element_text(size = 20))
        g2
}
# Shiny is such a clever beast!
shinyServer(
        function(input, output) {
                output$randPlot  <- renderPlot({
                        # Set up the Game with the two choices of dice and keep score
                        Game <- as.data.frame( 
                                cbind(
                                        sample (dice[,as.numeric(input$pick)],sample,replace=TRUE),
                                        sample (dice[,mypick[as.numeric(input$pick)]],sample,replace=TRUE),
                                        sample (0,sample,replace=TRUE),
                                        1:sample
                                )
                        )
                        names(Game) <- c("pick","yourpick","score","roll")
                        # Now play the game
                        score <<- 0
                        for (i in 1:sample) {
                                if (Game[i,1]>Game[i,2]) (score<-score-1) 
                                else (score<-score+1)
                                Game[i,3]=score
                        }
                        # And plot the result
                        gameplot(Game)
                        })                
                output$mess  <- renderPrint(
                        # Don't forget some trash talking!
                        cat("You picked",
                            noquote(dicename[as.numeric(input$pick)]),
                            " and I picked",
                            noquote(dicename[mypick[as.numeric(input$pick)]])
                        ))
        }
)
