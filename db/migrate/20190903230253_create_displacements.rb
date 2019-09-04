class CreateDisplacements < ActiveRecord::Migration[5.2]
  def change
    create_table :displacements do |t|
      t.string :cc, null: false
      t.timestamps
    end
  end
end
