class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :type
      t.integer :seats
      t.boolean :full
      
      t.timestamps
    end
  end
end
