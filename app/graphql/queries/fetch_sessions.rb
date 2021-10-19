module Queries
  class FetchSessions < Queries::BaseQuery
    type [Types::SessionType], null: false
    
    argument :user_id, String, required: true

    def resolve(user_id:)
      Session.where(user_id: user_id)
    end
  end
end