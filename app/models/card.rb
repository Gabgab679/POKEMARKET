class Card < ApplicationRecord
  STATES = ["Mint", "Near Mint", "Good condition", "Acceptable", "Damaged"]

  belongs_to :user #Seller
  has_one :sale, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true, inclusion: { in: STATES }
  validates :price, presence: true

  has_many_attached :photos
end
