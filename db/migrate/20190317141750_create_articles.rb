class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.integer :category_id, foreign_key: true
      t.string :title, null: false
      t.text   :text ,null: false
      t.timestamps null: true
    end

    add_index :articles, :title

  end
end
