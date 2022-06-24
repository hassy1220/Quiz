class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title,null: false
      t.text :content,null: false
      t.integer :customer_id,null: false
      t.integer :status,default: 0,null: false
      t.timestamps
    end
  end
end
