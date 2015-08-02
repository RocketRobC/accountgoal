class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.string :name
      t.string :details
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
