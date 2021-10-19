class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.datetime :last_started
      t.integer :elapsed_time
      t.boolean :in_session

      t.timestamps
    end
  end
end
