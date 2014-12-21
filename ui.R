shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Projectile Motion"),
        sidebarPanel(
            numericInput('g', 'Acceleration due to gravity (m/s^2)', 9.8, min = 1, max = 24.5, step = 0.1),
            numericInput('v0', 'Initial speed (m/s)', 10, min = 0, max = 1200, step = 1),
            numericInput('theta', 'Launch angle (degrees)', 45, min = 0, max = 90, step = 1),
            sliderInput('nstep', 'Step', value = 15, min = 0, max = 30, step = 1),
            submitButton('Submit'),
            p("Documentation:", a("Projectile Motion",href="Documentation.html"))
        ),
        mainPanel(
            #h3('Results of prediction'),
            h4('Total duration (seconds)'),
            verbatimTextOutput("duration"),
            h4('Maximum range (meters)'),
            verbatimTextOutput("maxRange"),
            h4('Maximum height (meters)'),
            verbatimTextOutput("maxHeight"),
            plotOutput('trajectory')
        )
    )
)