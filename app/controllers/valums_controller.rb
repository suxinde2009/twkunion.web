class ValumsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    file = UStringIO.new(params[:qqfile], request.raw_post)
    type = params[:photogenic_type]

    @photo = AssetPhoto.new(data: file, photogenic_type: type)
    if @photo.save
      render json: { :success => true, :src => @photo.data.url }
    else
     render json: @photo.errors.to_json
    end
  end

end