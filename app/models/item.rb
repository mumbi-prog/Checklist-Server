class Item < ApplicationRecord
  belongs_to :category
  has_many :checklist_items
  has_many :checklists, through: :checklist_items

  validates :name, presence: true, uniqueness: { scope: :category_id }
end
