class ImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :description, :owner, :metadata, :url
 
  def url
    object.file.service_url
  end

  def metadata
    object.file.metadata
  end
end
