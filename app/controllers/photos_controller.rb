class PhotosController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :create] #Unsure if we want both?

  def show
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @url = params[:photo][:photo_url]
    render :show
  end

  private
    def set_s3_direct_post
      # Maybe don't put them in folders? I don't really care about the name, ignore filename altogether?
      @s3_direct_post = S3_BUCKET.presigned_post(key:"uploads/#{SecureRandom.uuid}/${filename}",
                                                 success_action_status: '201', acl: 'public-read')
    end
  
end
