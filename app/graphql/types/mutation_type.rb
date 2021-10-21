module Types
  class MutationType < Types::BaseObject
    include Resolvers::Mutations::Sessions
    # include Resolvers::Mutations::UpdateSession
  end
end

