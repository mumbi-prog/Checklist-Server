class ChecklistItem < ApplicationRecord
  belongs_to :item
  belongs_to :checklist

  validates :status, presence: true, inclusion: { in: %w[OK NOT_OK] }
  validates :item_id, uniqueness: { scope: :checklist_id }
end
