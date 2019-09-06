class CreateArticlesTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_types do |t|
      t.integer  :type_id
      t.integer  :article_id
      t.timestamps
    end
  end
end
