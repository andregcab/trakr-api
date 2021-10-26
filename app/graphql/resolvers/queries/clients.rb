module Resolvers
    module Queries
      module Clients
        include GraphQL::Schema::Member::GraphQLTypeNames
        # split this off into its own lib possibly?
        ClientQuery = KreeperClient::Client.parse <<-'GRAPHQL'
            query($name: String!) {
                groups: groups(nameContains: $name, category: "clients", first: 50) {
                    edges {
                        node {
                            id
                            name
                            clientName
                        }
                    }
                }
            }
        GRAPHQL

        def self.included(base)
          base.field :clients, [CustomTypes::ClientType], null: false do
            argument :search_term, String, required: true
          end
        end
  
        def clients(search_term:)
            # can also probably also move this to its own lib
            response = KreeperClient::Client.query(ClientQuery, variables: {name: search_term})
            kreeper_client_nodes = KreeperClient.normalize_response(response.original_hash["data"]["groups"]["edges"])
            kreeper_clients = kreeper_client_nodes.map {|client| {id: client[:node][:id] || "", name: client[:node][:name] || "", client_name: client[:node][:client_name] || ""}}

            kreeper_clients
        end
      end
    end
  end