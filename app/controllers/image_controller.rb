class ImageController < ApplicationController
  def show
    render json: Image.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head 404, content_type: 'text/plain'
  end

  def all
    images = Image.all
    render json: images, status: images.empty? ? 204 : 200
  end

  def save
    image = Image.new(save_image_params)
    unless image.save
      render json: {status: 'ERROR', message:'Image not saved', data:image.errors}, status: :unprocessable_entity
    else
      render json: image, status: 201
    end
  end

  private
  def save_image_params
    params.permit(:description, :owner, :file)
  end
end
