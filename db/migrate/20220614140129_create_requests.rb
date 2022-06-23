class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title,null: false
      t.text :content
      t.integer :customer_id
      t.integer :status,default: 0,null: false
      t.timestamps
    end
  end
end
