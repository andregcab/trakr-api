module Types
  class MutationType < Types::BaseObject
<<<<<<< Updated upstream
    field :create_session, mutation: Mutations::CreateSession
=======
    include Resolvers::Mutations::Sessions
    # include Resolvers::Mutations::UpdateSession
>>>>>>> Stashed changes
  end
end

