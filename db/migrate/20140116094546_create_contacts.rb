class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :type
      t.string :email
      t.string :yahoo
      t.string :skype
      t.string :phone
      t.string :mobile
      t.string :address
      t.string :city
      t.string :note
      t.string :description
      t.string :status
      t.boolean :deleted

      t.timestamps
    end
  end
end
