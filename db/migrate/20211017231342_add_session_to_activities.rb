class AddSessionToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :session, null: false, foreign_key: true
  end
end
