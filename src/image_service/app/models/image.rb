class Image < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :description, presence: true
  validates :owner, presence: true
  validates :file, presence: true

  has_one_attached :file
end
