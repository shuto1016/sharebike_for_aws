class CreateArticlesMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_makers do |t|
      t.integer  :maker_id
      t.integer  :article_id
      t.timestamps
    end
  end
end
