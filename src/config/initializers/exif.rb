module ActiveStorage
  class Analyzer::ImageAnalyzer < Analyzer
    def metadata
      read_image do |image|
        if rotated_image?(image)
          { width: image.height, height: image.width }
        else
          { width: image.width, height: image.height }
        end.merge(Exif::Data.new(IO.read(image.path)).to_h || {})
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end
  end
end