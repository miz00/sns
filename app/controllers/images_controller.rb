class ImagesController < ApplicationController
    
    # POST users/:user_id/tweets/:tweet_id/images
    def create
        Image.create(image_params)
    end
    
    private
    def image_params
        params.require(:image).permit(:tweet_id, :image)
    end
end
