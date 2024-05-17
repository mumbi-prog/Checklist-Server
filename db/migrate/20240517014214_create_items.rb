class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :status
      t.text :remark
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :items, [:name, :category_id], unique: true
  end
end
