class CreateVestAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :vest_answers do |t|
      t.integer :question_id,null: false
      t.string :description,null: false
      t.timestamps
    end
  end
end
