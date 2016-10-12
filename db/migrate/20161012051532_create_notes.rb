class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :team_id
      t.text :body

      t.timestamps
    end
  end
end
