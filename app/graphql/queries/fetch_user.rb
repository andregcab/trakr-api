module Queries
  class FetchUser < Queries::BaseQuery

    type Types::UserType, null: false
    argument :user_id, String, required: true

    def resolve(user_id:)
      User.find(user_id)
    end
  end
end