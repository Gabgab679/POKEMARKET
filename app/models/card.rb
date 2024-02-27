class Card < ApplicationRecord
  belongs_to :user #Seller
  has_one :sale

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :state, presence: true, inclusion: { in: ["Mint", "Near Mint", "Good condition", "Acceptable", "Damaged"] }
  validates :price, presence: true
end
