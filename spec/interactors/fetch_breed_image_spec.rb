require 'spec_helper'

RSpec.describe FetchBreedImage, type: :interactor do
  describe '.call' do
    let(:breed) { 'hound' }

    context 'when the breed is valid' do
      let(:context) { FetchBreedImage.call(breed: breed) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'sets the image URL and breed in the context' do
        expect(context.image_url).to be_present
        expect(context.breed).to eq('Hound') # Assuming capitalize method is used in the interactor
      end
    end

    context 'when the breed is invalid' do
      let(:invalid_breed) { 'invalid_breed' }
      let(:context) { FetchBreedImage.call(breed: invalid_breed) }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'provides an error message' do
        error_message = "Please Change. Only english alphabets are allowed (letters only & no spaces)."
        expect(context.error).to eq(error_message)
      end
    end
  end
end
