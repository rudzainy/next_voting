class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :team_id
      t.text :body

      t.timestamps
    end
  end
end