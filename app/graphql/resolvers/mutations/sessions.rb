module Resolvers
  module Mutations
    module Sessions
      include GraphQL::Schema::Member::GraphQLTypeNames

      def self.included(base)
        base.field :create_session, CustomTypes::SessionType, null: false do
          argument :data, Inputs::SessionInputs::CreateSessionInput, required: true
        end

        base.field :update_session_and_activity, CustomTypes::SessionType, null: false do
          argument :id, ID, required: true
          argument :data, Inputs::SessionInputs::UpdateSessionInput, required: true
        end
      end

      def create_session(data:)
        Session.create!(data)
      end

      def update_session_and_activity(id:, data:)
        session = Session.find(id)

        session.update(data)
        session
      end
    end
  end
end