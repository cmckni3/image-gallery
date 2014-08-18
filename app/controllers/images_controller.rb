class ImagesController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          data = { id: @image.id, thumb: view_context.image_tag(@image.attachment.url(:thumb))}
          render json: data, status: :created#, location: @image
        end
      else
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def image_params
    params.require(:image).permit(:attachment)
  end
end
