class AddProjectIdToAttacks < ActiveRecord::Migration[7.0]
  def change
    add_column :attacks, :project_id, :integer
    add_index :attacks, :project_id
  end
end
