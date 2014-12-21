library(shiny)
duration <- function(V, theta, g) 2 * V * sin(theta*pi/180) / g
horizontal <- function(V, theta, t) V * t * cos(theta*pi/180)
vertical <- function(V, theta, g, t) V * t * sin(theta*pi/180) - 1/2 * g * t^2

shinyServer(
    function(input, output) {
        output$duration <- renderPrint({round(duration(input$v0, input$theta, input$g),3)})
        output$maxRange <- renderPrint({round(horizontal(input$v0, input$theta, duration(input$v0, input$theta, input$g)),3)})
        output$maxHeight <- renderPrint({round(vertical(input$v0, input$theta, input$g, duration(input$v0, input$theta, input$g)/2),3)})
        output$trajectory <- renderPlot({
            t <- duration(input$v0, input$theta, input$g)
            t <- seq(0, t, t/30)
            x <- horizontal(input$v0, input$theta, t)
            y <- vertical(input$v0, input$theta, input$g, t)
            
            tmax <- duration(input$v0, 45, input$g)
            xmax <- horizontal(input$v0, 45, tmax)
            ymax <- vertical(input$v0, 90, input$g, tmax/2)
            
            plot(x, y, xlim=c(0,xmax+xmax*0.01), ylim=c(0,ymax+ymax*0.1), col="red", 
                 main="Projectile Trajectory",
                 xlab="range", ylab="height")
            lines(x,y,col="red")
            
            points(x[input$nstep+1],y[input$nstep+1], col = "blue", pch = 16, cex = 1.5)
            text(0.7*xmax, 0.98*ymax, paste("range = ", round(x[input$nstep+1], 2), "m"), col = "blue", pos = 4)
            text(0.7*xmax, 0.90*ymax, paste("height = ", round(y[input$nstep+1], 2), "m"), col = "blue", pos = 4)
            text(0.7*xmax, 0.83*ymax, paste("duration = ", round(t[input$nstep+1], 2), "s"), col = "blue", pos = 4)
        })
    }
)