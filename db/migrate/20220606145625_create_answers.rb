class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :customer_id
      t.integer :score
      t.integer :quiz_id

      t.timestamps
    end
  end
end
