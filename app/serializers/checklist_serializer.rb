class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :date, :checklist_items
end
