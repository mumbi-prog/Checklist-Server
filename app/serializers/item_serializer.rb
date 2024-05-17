class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :remark
end
