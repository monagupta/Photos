class PhotosController < ApplicationController
  around_action :catch_not_found, only: :show

  def show
    photo = Photo.find(params[:id])
    @url = photo.url
  end
  
  def new
    set_s3_direct_post
    @photo = Photo.new
  end

  def create
    url = params[:photo][:photo_url]
    photo = Photo.create(url: url)
    redirect_to action: :show, id: photo.id
  end

  private
    def set_s3_direct_post
      # Maybe don't put them in folders? I don't really care about the name, ignore filename altogether?
      @s3_direct_post = S3_BUCKET.presigned_post(key:"uploads/#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201', acl: 'public-read')
    end
end
