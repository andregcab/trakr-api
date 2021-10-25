module Resolvers
  module Queries
    module Sessions
      include GraphQL::Schema::Member::GraphQLTypeNames

      def self.included(base)
        base.field :sessions, [CustomTypes::SessionType], null: false do
            argument :where, Inputs::SessionInputs::SessionWhereInput, required: true
        end
      end

      def sessions(where: {})
        Session.where(where).order(created_at: :desc)
      end
    end
  end
end