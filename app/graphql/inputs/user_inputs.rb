module Inputs
    module UserInputs
      class CreateUserInput < Types::BaseInputObject
        description "Arguments for creating a session"
  
        argument :name, String, required: true
        argument :email, String, required: true
      end
    end
  end