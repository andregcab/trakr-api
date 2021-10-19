module Types
  module Input
    class ActivityInput < Types::BaseInputObject
      description "Arguments for creating an activity nested under a session"

      argument :session_id, ID, required: false
      argument :activity_type, Enums::ActivityEnums::ActivityTypesEnum, required: false
      argument :eng_name, String, required: false
      argument :charge_code, String, required: false
      argument :client_name, String, required: false
      argument :client_number, String, required: false
      argument :comment, String, required: false
    end
  end
end