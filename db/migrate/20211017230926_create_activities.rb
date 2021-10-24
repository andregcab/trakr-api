class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :activity_type, null: false
      t.string :eng_name, null: true
      t.string :charge_code, null: true
      t.string :client_name, null: true
      t.string :client_number, null: true
      t.string :comment, null: true

      t.timestamps
    end
      
    add_reference :activities, :session, null: false, foreign_key: true
  end
end
