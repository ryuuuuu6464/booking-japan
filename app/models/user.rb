class User < ApplicationRecord
  has_secure_password
  has_one_attached :icon

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { in: 8..12 }, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :introduction, length: { maximum: 50 }
end
