module Types
  class MutationType < Types::BaseObject
    field :create_session, mutation: Mutations::CreateSession
    field :update_session, mutation: Mutations::UpdateSession
  end
end

