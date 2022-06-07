class Quiz < ApplicationRecord
  has_many:questions,dependent: :destroy
  has_many:answers,dependent: :destroy
end
