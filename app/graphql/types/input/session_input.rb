module Types
  module Input
    class SessionInput < Types::BaseInputObject
      description "Arguments for creating a session"

      argument :id, ID, required: false
      argument :user_id, ID, required: false
      argument :in_session, Boolean, required: false
      argument :elapsed_time, Integer, required: false
      argument :last_started, GraphQL::Types::ISO8601DateTime, required: false
      argument :activity_attributes,
      [Types::Input::ActivityInput],
      required: false
    end
  end
end