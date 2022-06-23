class Request < ApplicationRecord
  belongs_to:customer
  validates :title,presence: true
  validates :content,presence: true

  enum status: {wait: 0,support: 1,complete: 2}
end
