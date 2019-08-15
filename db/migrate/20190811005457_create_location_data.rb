class CreateLocationData < ActiveRecord::Migration[5.2]
  def change
    create_table :location_data do |t|
      t.integer :source, index: true
      t.integer :start_node
      t.integer :end_node
      t.datetime :start_time
      t.datetime :end_time
      t.references :pass

      t.timestamps null: false
    end
  end
end
