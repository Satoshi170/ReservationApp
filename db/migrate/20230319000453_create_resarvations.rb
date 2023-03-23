class CreateResarvations < ActiveRecord::Migration[6.1]
  def change
    create_table :resarvations do |t|
      t.date :checkin_date
      t.date :checkout_date
      t.integer :count_people
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
