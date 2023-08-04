class GalleryThumbnailController < ApplicationController
    skip_before_action :authorized, only: [:index ,:create]
    def index
        thumbnails = GalleryThumbnail.all
        render json: thumbnails
    end
    def create
        thumbnails = GalleryThumbnail.create(gallery_params)
        render json: thumbnails
    end

    private
    def gallery_params
        params.permit(:)
    end
end
