module Types
  class SessionType < Types::BaseObject
    field :id, ID, null: false
    field :last_started, GraphQL::Types::ISO8601DateTime, null: true
    field :elapsed_time, Integer, null: true
    field :in_session, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
    field :activities, [Types::ActivityType], null: true

    def activities 
      Activities.where(session_id: object.id)
    end
  end
end
