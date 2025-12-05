class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  has_one_attached :image
  
  validates :name, presence: true
  validates :introduction, presence: true, length: { in: 5..50 }
  validates :price_per_night, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :address, presence: true

  def self.serch_area(area)
    if area.present?
      where("address LIKE?", "%#{area}%")
    else
      all
    end
  end

  def self.serch_keyword(keyword)
    if keyword.present?
      where("name LIKE :kw OR introduction LIKE :kw", kw: "%#{keyword}%")
    else
      all
    end
  end
end
