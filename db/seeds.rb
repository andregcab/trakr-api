# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = [
    {
        first_name: "jose",
        last_name: "arjona",
        email: "jarjona@kaufmanrossin.com"
    },
    {
        first_name: "andre",
        last_name: "cabrera",
        email: "acabrera@kaufmanrossin.com"
    },
    {
        first_name: "shrekard",
        last_name: "swampington",
        email: "shrek@swamp.com"
    }
]

User.create!(users)

sessions = [
    {
        user_id: 1
    },
    {
        user_id: 2
    },
    {
        user_id: 3
    }
]

Session.create!(sessions)

activities = [
    {
        activity_type: "billable",
        eng_name: "eng name 1",
        client_name: "client name 1",
        client_number: "1234",
        comment: "a comment 1",
        session_id: 1
    }, 
    {
        activity_type: "personal",
        client_name: "a personal activity",
        comment: "a personal comment 1",
        session_id: 2
    },
    {
        activity_type: "billable",
        eng_name: "eng name 2",
        client_name: "client name 2",
        client_number: "1234321",
        comment: "a comment 2",
        session_id: 3
    }
]

Activity.create!(activities)