module Resolvers
  module Queries
    module Users
      include GraphQL::Schema::Member::GraphQLTypeNames

      def self.included(base)
        base.field :user, CustomTypes::UserType, null: false do
          argument :id, ID, required: true
        end
      end

      def user(id:)
        User.find(id)
      end
    end
  end
end