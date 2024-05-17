class CreateChecklistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :checklist_items do |t|
      t.string :status
      t.text :remark
      t.references :item, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
