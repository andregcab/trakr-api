module CustomTypes
  class UserType < Types::BaseObject
    description "A User"

    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :uuid, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :sessions, [CustomTypes::SessionType], null: true

    def sessions 
      Session.where(user_id: object.id)
    end
  end
end
