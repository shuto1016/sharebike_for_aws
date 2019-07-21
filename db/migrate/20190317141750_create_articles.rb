class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text   :text ,null: false
      t.integer :user_id
      t.timestamps null: true
    end
  end
end
