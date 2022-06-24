class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :customer_id,null: false
      t.integer :score,null: false
      t.integer :quiz_id,null: false

      t.timestamps
    end
  end
end
