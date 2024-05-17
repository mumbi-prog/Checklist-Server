class CreateChecklists < ActiveRecord::Migration[7.1]
  def change
    create_table :checklists do |t|
      t.date :date, null: false

      t.timestamps
    end

    add_index :checklists, :date, unique: true
  end
end
