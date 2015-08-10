class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
