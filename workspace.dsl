workspace "System X" "System Landscape Diagram based on sketch" {

    !identifiers hierarchical

    model {

        user = person "User" {
            description "End user who performs data querying, analysis, and data management operations"
        }

        influxdb = softwareSystem "InfluxDB 3 Core" {
            description "Core time-series database system"
            tags "Database"
        }

        explorer = softwareSystem "InfluxDB Explorer(HTTP)" {
            description "Web-based user interface for InfluxDB, providing data exploration, querying, and administrative capabilities"
        }

        formucut = softwareSystem "FormuCut" {
            description "Description to be defined"
        }

        clairvoyance = softwareSystem "Clairvoyance" {
            description "Description to be defined"
        }

        user -> explorer "Performs data querying, analysis, and administrative tasks" "HTTP"
        explorer -> user "Displays data, analysis results, and management messages" "HTTP"
        user -> formucut "Interaction to be defined" "HTTP"
        user -> clairvoyance "Interaction to be defined" "HTTP"

        explorer -> influxdb "Performs data analysis and database administration" "REST API"
        influxdb -> explorer "Responds with data or management messages" "REST API"
        formucut -> influxdb "Writes data" "Python Client"
        influxdb -> formucut "Queries data" "Python Client"

        clairvoyance -> influxdb "Writes data" "C# Client"
        influxdb -> clairvoyance "Queries data" "C# Client"
    }

    views {

        systemLandscape "SystemLandscape" {
            include *
            autolayout lr 800 800
        }

        styles {

            element "Person" {
                shape person
                background #035a8d
                color #ffffff
            }

            element "Software System" {
                shape roundedbox
                background #1168bd
                color #ffffff
            }

            element "Database" {
                shape cylinder
            }

            relationship "Relationship" {
                thickness 4
            }

        }
    }

    configuration {
        scope "SoftwareSystem"
    }
}
