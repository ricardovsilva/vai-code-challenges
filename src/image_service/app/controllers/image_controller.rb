class ImageController < ActionController::API
  def show
    Image.find params[:id]
  end

  def all
    Image.all
  end

  def save
    'Hello World!'
  end
end
