class CreateArticlesDisplacements < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_displacements do |t|
      t.integer  :displacement_id
      t.integer  :article_id
      t.timestamps
    end
  end
end
