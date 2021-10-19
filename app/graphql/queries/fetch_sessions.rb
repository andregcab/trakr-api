module Queries
  class FetchSessions < Queries::BaseQuery

    type [Types::SessionType], null: false
    argument :session_id, String, required: true

    def resolve(session_id:)
      Session.find(session_id)
    end
  end
end