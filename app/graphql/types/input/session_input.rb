module Types
  module Input
    class SessionInput < Types::BaseInputObject
      description "Arguments for creating a session"

      argument :user_id, ID, required: true
      argument :activity_attributes,
      [Types::Input::ActivityInput],
      required: false
    end
  end
end