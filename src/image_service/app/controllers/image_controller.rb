class ImageController < ApplicationController
  def show
    render json: Image.find(params[:id])
  end

  def all
    render json: Image.all
  end

  def save
    Image.new(save_image_params).save
  end

  private
  def save_image_params
    params.permit(:description, :owner, :file)
  end
end
