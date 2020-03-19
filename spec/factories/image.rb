require 'faker'
require_relative '../support/images_sample'


FactoryBot.define do
  factory :image do
    owner { Faker::Name.name }
    description { Faker::Internet.email }
    file { Rack::Test::UploadedFile.new(get_sample_file()) }
  end
end