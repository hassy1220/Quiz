class Request < ApplicationRecord
  belongs_to:customer
  validates :title,presence: true
  validates :content,presence: true
end
