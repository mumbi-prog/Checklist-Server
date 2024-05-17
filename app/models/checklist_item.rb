class ChecklistItem < ApplicationRecord
  belongs_to :item
  belongs_to :checklist
end
