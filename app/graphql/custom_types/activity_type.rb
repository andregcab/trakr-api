module CustomTypes
  class ActivityType < Types::BaseObject
    description "An Activity"

    field :id, ID, null: false
    field :activity_type, Enums::ActivityEnums::ActivityTypesEnum, null: true
    field :eng_name, String, null: true
    field :charge_code, String, null: true
    field :client_name, String, null: true
    field :client_number, String, null: true
    field :comment, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :session_id, Integer, null: false
  end
end
