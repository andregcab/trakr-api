module Types
  class MutationType < Types::BaseObject
    field :create_session, mutation: Mutations::CreateSession
  end
end

