module Mutations
  class UpdateSession < Mutations::BaseMutation
    argument :data, Types::Input::SessionInput, required: true
    
    field :session, Types::SessionType, null: false

    def resolve(data:)
      session_data = Hash data
      puts "SESH DATA", session_data

      session = Session.find(session_data[:id])
      puts 'SESSION', session.inspect
      puts 'ARGS', session_data.except!(:id, :activity_attributes)
      session.update(session_data.except!(:id, :activity_attributes))

      activity_data = session_data[:activity_attributes][0]
      activity_data.merge!(session_id: session[:id])

      Activity.update(activity_data)

      session = Session.find(session[:id])
      return { session: session }
    end
  end
end