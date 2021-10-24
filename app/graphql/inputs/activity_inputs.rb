module Inputs
  module ActivityInputs
    class CreateActivityInput < Types::BaseInputObject
      description "Arguments for creating an activity"

      argument :session_id, ID, required: false
      argument :activity_type, Enums::ActivityEnums::ActivityTypesEnum, required: true
      argument :eng_name, String, required: false
      argument :charge_code, String, required: false
      argument :client_name, String, required: false
      argument :client_number, String, required: false
      argument :comment, String, required: false
    end
    class UpdateActivityInput < Types::BaseInputObject
      description "Arguments for updating an activity"

      argument :id, ID, required: false
      argument :activity_type, Enums::ActivityEnums::ActivityTypesEnum, required: false
      argument :eng_name, String, required: false
      argument :charge_code, String, required: false
      argument :client_name, String, required: false
      argument :client_number, String, required: false
      argument :comment, String, required: false
    end
  end
end