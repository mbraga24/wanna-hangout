class CreateUserHangouts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_hangouts do |t|
      t.integer :user_id
      t.integer :hangout_id
      t.boolean :accepted
      t.timestamps
    end
  end
end
