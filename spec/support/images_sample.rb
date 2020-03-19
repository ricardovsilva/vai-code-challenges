def get_sample_file
  images_folder = Rails.root.join('spec', 'images', '**') 
  images_extensions = ['*.jpg', '*.jpeg', '*.tiff']
  images = Dir.glob(images_extensions.map {|extension| images_folder.join(extension)})
  images.sample
end