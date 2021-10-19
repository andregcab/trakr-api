module Mutations
  class CreateSession < Mutations::BaseMutation
    argument :data, Types::Input::SessionInput, required: true
      
    field :id, ID, null: false
    field :last_started, GraphQL::Types::ISO8601DateTime, null: true
    field :elapsed_time, Integer, null: true
    field :in_session, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
    field :activities, [Types::ActivityType], null: true


    def resolve(data:)
      session_data = Hash data
      puts 'DATATTATA', data.class
      puts 'ACCCC', session_data[:activity_attributes].class
      session = Session.create({user_id: session_data[:user_id]})
      activity_data = session_data[:activity_attributes][0]
      puts 'ADDDDD', activity_data
      puts 'ADTYPE', activity_data.class
      activity_data.merge!(session_id: session[:id])

      Activity.create(activity_data)

      meoow = Session.find(session[:id])

      puts 'MEOW', meoow.inspect
      return meoow
    end
  end
end