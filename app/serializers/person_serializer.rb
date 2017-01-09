class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :lonlat, :items
end
