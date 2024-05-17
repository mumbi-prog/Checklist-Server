class CreateChecklistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :checklist_items do |t|
      t.string :status, null: false
      t.text :remark
      t.references :item, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end

    add_index :checklist_items, [:item_id, :checklist_id], unique: true
  end
end
