class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  has_one_attached :image
  has_many :rooms
  has_many :reservations

  before_create :default_image

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  private

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_defaulticon.jpeg')), filename: 'user_defaulticon.jpeg', content_type: 'image/jpeg')
    end
  end
end
