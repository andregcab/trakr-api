class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.datetime :last_started
      t.integer :elapsed_time, null: false, default: 0
      t.boolean :in_session, null: false, default: false

      t.timestamps
    end
    
    add_reference :sessions, :user, null: false, foreign_key: true
  end
end
