class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many:answers,dependent: :destroy
  has_many:requests,dependent: :destroy
  validates :name,presence: :true

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
    end
  end

end
