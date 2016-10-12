class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.boolean :long_answer
      t.text :body

      t.timestamps
    end
  end
end
