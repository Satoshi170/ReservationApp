class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin_date, presence: true
  validate :start_check
  validates :checkout_date, presence: true
  validate :start_end_check
  validates :count_people, presence: true

  private

  def start_check
    if Date.current > checkin_date
      errors.add(:checkin_date, "は過去の日付を登録できません")
    end
  end

  def start_end_check
    if checkin_date >= checkout_date
      errors.add(:checkout_date, "はチェックイン日より後の日付にしてください")
    end
  end
end
