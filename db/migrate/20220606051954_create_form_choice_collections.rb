class CreateFormChoiceCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :form_choice_collections do |t|

      t.timestamps
    end
  end
end
