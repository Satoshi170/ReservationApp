class Room < ApplicationRecord
  has_one_attached :image

  before_create :default_image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :address, presence: true

  private

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'room_defaultimage.jpeg')), filename: 'room_defaultimage.jpeg', content_type: 'image/jpeg')
    end
  end
end
