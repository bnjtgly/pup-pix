# frozen_string_literal: true

class BreedValidator
  include Helper::BasicHelper
  include ActiveModel::Validations

  attr_accessor :breed

  validate :required, :valid_dog_breed

  def initialize(payload)
    @breed = payload[:breed]
  end

  def submit
    persist!
  end

  private

  def persist!
    return true if valid?

    false
  end

  def required
    errors.add(:breed, REQUIRED_MESSAGE) if breed.blank?
  end

  def valid_dog_breed
    errors.add(:breed, "#{PLEASE_CHANGE_MESSAGE} #{ENGLISH_ALPHABETS_ONLY_MESSAGE}") unless valid_name?(breed)
  end
end
