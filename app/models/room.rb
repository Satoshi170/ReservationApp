class Room < ApplicationRecord
  has_one_attached :image
  has_many :reservations
  belongs_to :user

  before_create :default_image

  validates :name, presence: true
  validates :content, presence: true
  validates :price, presence: true
  validates :address, presence: true

  private

  def self.ransackable_attributes(auth_object = nil)
    ["address", "name", "content"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "reservations", "user"]
  end

  def default_image
    if !self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'room_defaultimage.jpeg')), filename: 'room_defaultimage.jpeg', content_type: 'image/jpeg')
    end
  end

end
