class CreateBookTours < ActiveRecord::Migration
  def change
    create_table :book_tours do |t|
      t.string :tour_code
      t.string :cust_name
      t.string :cust_phone
      t.string :cust_mobile
      t.string :cust_email
      t.integer :attendes
      t.string :note
      t.string :description
      t.date :date_slot
      t.time :time_slot
      t.string :status
      t.boolean :deleted

      t.timestamps
    end
  end
end
