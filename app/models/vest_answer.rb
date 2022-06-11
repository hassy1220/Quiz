class VestAnswer < ApplicationRecord
  belongs_to:question

  validates :description,presence: :true
end
