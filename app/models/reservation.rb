class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :guest_count, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validate :check_out_after_check_in
  validate :check_in_after_today

  def  check_out_after_check_in
    if check_out <= check_in
      errors.add(:check_out, "はチェックインより後の日付を入力してください")
    end
  end

  def check_in_after_today
    check_in < Time.zone.today
  end

  def nights
    (check_out - check_in).to_i
  end

  def total_price
    nights * guest_count * room.price_per_night
  end

end
