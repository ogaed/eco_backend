class EducationalContentSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :content
end
