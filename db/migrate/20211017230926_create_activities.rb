class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.integer :activity_type
      t.string :eng_name
      t.string :charge_code
      t.string :client_name
      t.string :client_number
      t.string :comment

      t.timestamps
    end
  end
end
