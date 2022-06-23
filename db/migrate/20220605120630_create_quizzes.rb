class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :name,null: false
      t.boolean :status,default: false,null: false
      t.timestamps
    end
  end
end
