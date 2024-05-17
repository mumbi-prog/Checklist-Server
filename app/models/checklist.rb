class Checklist < ApplicationRecord
    has_many :checklist_items, dependent: :destroy
    has_many :items, through: :checklist_items

    validates :date, presence: true, uniqueness: true
end
