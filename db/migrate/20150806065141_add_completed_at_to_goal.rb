class AddCompletedAtToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :completed_at, :datetime
    add_index :goals, :completed_at
  end


end
