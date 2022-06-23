class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.integer :question_id,null: false
      t.boolean :answer,default: false,null: false
      t.string :body,null: false

      t.timestamps
    end
  end
end
