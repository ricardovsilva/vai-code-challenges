class ImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :description, :owner, :metadata, :url, :created_at
 
  def url
    object.file.service_url
  end

  def metadata
    object.file.analyze unless object.file.analyzed?
    object.file.metadata
  end
end
