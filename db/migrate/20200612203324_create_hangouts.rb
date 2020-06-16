class CreateHangouts < ActiveRecord::Migration[6.0]
  def change
    create_table :hangouts do |t|
      t.string :activity
      t.integer :location_id
      t.timestamps
    end
  end
end
