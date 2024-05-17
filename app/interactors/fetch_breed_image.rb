class FetchBreedImage
  include Interactor
  include HTTParty

  def call
    validate!
    build
  end

  def build
    breed = payload[:breed].downcase
    response = self.class.get("#{base_uri}/breed/#{breed}/images/random")

    if response.success?
      json_response = JSON.parse(response.body)
      context.image_url = json_response['message']
      context.breed = breed.capitalize
    else
      context.fail!(error: "Breed not found")
    end
  end

  def validate!
    verify = BreedValidator.new(payload)
    return true if verify.submit

    context.fail!(error: verify.errors.try(:first).try(:type))
  end

  def base_uri
    'https://dog.ceo/api'
  end

  def payload
    {
      breed: context.breed
    }
  end
end
