class AddNameToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :fname, :string
    add_column :contacts, :lname, :string
    add_column :contacts, :email, :string
    add_index :contacts, :email
  end
end
