class DogBreedsController < ApplicationController
  def index
  end

  def fetch_breed
    interact = FetchBreedImage.call(breed: params[:breed])

    if interact.success?
      render json: { image_url: interact.image_url, breed: interact.breed }, status: :ok
    else
      render json: { error: interact.error }, status: :not_found
    end
  end
end
