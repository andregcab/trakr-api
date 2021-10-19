module Mutations
  class CreateSession < Mutations::BaseMutation
    argument :data, Types::Input::SessionInput, required: true
    
    field :session, Types::SessionType, null: false

    def resolve(data:)
      session_data = Hash data
      session = Session.create({user_id: session_data[:user_id]})

      activity_data = session_data[:activity_attributes][0]
      activity_data.merge!(session_id: session[:id])

      Activity.create(activity_data)

      session = Session.find(session[:id])
      return { session: session }
    end
  end
end