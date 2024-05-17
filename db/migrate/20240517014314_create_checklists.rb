class CreateChecklists < ActiveRecord::Migration[7.1]
  def change
    create_table :checklists do |t|
      t.date :date

      t.timestamps
    end
  end
end
