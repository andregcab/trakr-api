module Types
  class MutationType < Types::BaseObject
    include Resolvers::Mutations::Sessions
    include Resolvers::Mutations::Users
  end
end

