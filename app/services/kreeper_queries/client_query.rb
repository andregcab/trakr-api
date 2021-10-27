module Clients
    # CLIENTS_FROM_SEARCH = KreeperClient::Client.parse <<-'GRAPHQL'
    # query groupsAndUsers($name: String!) {
    #   groups: groups(nameContains: $name, category: "clients", first: 50) {
    #     edges {
    #       node {
    #         id
    #         name
    #         clientName
    #       }
    #     }
    #   }
    #   clientGroups: clientGroups(nameContains: $name) {
    #     edges {
    #       node {
    #         name: clientGroupName
    #       }
    #     }
    #   }
    # }
    # GRAPHQL
end