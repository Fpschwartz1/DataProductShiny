shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Projectile Motion"),
        sidebarPanel(
            numericInput('g', 'Acceleration due to gravity (m/sec^2)', 9.8, min = 1, max = 24.5, step = 0.1),
            numericInput('v0', 'Initial speed (m/sec)', 10, min = 0, max = 1200, step = 1),
            numericInput('theta', 'Launch angle (degrees)', 45, min = 0, max = 90, step = 1),
            submitButton('Submit'),
            p("Documentation:", a("Projectile Motion",href="Documentation.html"))
        ),
        mainPanel(
            #h3('Results of prediction'),
            h4('Duration (sec)'),
            verbatimTextOutput("duration"),
            h4('Maximum range (m)'),
            verbatimTextOutput("maxRange"),
            h4('Maximum height (m)'),
            verbatimTextOutput("maxHeight"),
            plotOutput('trajectory')
        )
    )
)