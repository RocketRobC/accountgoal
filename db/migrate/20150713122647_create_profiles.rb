class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :city
      t.string :country
      t.string :profileimage

      t.timestamps null: false
    end
  end
end
