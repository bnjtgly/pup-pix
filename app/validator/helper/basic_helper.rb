# frozen_string_literal: true

module Helper
  module BasicHelper
    PLEASE_CHANGE_MESSAGE = 'Please Change.'
    NOT_FOUND = 'Record does not exist.'
    REQUIRED_MESSAGE = 'This field is required.'
    ENGLISH_ALPHABETS_ONLY_MESSAGE = 'Only english alphabets are allowed (letters only & no spaces).'

    def valid_name?(value)
      data = value.to_s.match(/\A[A-Za-z]+(?:\s[A-Za-z]+)*\z/)
      return false if data.nil?

      true
    end
  end
end