module Inputs
  module SessionInputs
    class CreateSessionInput < Types::BaseInputObject
      description "Arguments for creating a session"

      argument :id, ID, required: false
      argument :user_id, ID, required: false
      argument :in_session, Boolean, required: false
      argument :elapsed_time, Integer, required: false
      argument :last_started, GraphQL::Types::ISO8601DateTime, required: false
      argument :activity_attributes,
      Inputs::ActivityInputs::CreateActivityInput,
      required: true
    end
    
    class UpdateSessionInput < Types::BaseInputObject
      description "Arguments for updating a session"

      argument :in_session, Boolean, required: false
      argument :elapsed_time, Integer, required: false
      argument :last_started, GraphQL::Types::ISO8601DateTime, required: false
      argument :activity_attributes, Inputs::ActivityInputs::UpdateActivityInput, required: false
    end
    
    class SessionWhereInput < Types::BaseInputObject
      description "arguments for where input"

      argument :user_id, ID, required: false
      # argument :session_date, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end