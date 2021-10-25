module Resolvers
    module Mutations
      module Users
        include GraphQL::Schema::Member::GraphQLTypeNames
  
        def self.included(base)
          base.field :create_user, CustomTypes::UserType, null: false do
            argument :data, Inputs::UserInputs::CreateUserInput, required: true
          end
        end
  
        def create_user(data:)
          User.create!(data)
        end
      end
    end
  end
  