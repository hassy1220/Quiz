class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.integer :question_id
      t.boolean :answer
      t.string :body

      t.timestamps
    end
  end
end
