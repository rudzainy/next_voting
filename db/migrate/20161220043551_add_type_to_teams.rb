class AddTypeToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :course, :string
  end
end
