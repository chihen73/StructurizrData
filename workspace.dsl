workspace "System X" "System Landscape Diagram based on sketch" {

    !identifiers hierarchical
### test
    model {

        user = person "User" {
            description "End user who performs data querying, analysis, and data management operations"
        }

        influxdb = softwareSystem "InfluxDB 3 Core" {
            description "Core time-series database system"
            tags "Database"
        }

        explorer = softwareSystem "InfluxDB Explorer" {
            description "Web-based user interface for InfluxDB, providing data exploration, querying, and administrative capabilities"
        }

        formucut = softwareSystem "FormuCut" {
            description "Description to be defined"
        }

        clairvoyance = softwareSystem "Clairvoyance" {
            description "Description to be defined"
        }

        user -> explorer "Performs data querying, analysis, and administrative tasks"
        explorer -> user "Displays data, analysis results, and management messages"
        user -> formucut "Interaction to be defined"
        user -> clairvoyance "Interaction to be defined"

        explorer -> influxdb "Performs data analysis and database administration"
        influxdb -> explorer "Responds with data or management messages"
        formucut -> influxdb "Writes data"
        influxdb -> formucut "Queries data"

        clairvoyance -> influxdb "Writes data"
        influxdb -> clairvoyance "Queries data"
    }

    views {

        systemLandscape "SystemLandscape" {
            include *
            autolayout lr
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
