class User < ApplicationRecord
  has_many :cards, dependent: :destroy
  # les demandes de users faites sur tes propres cards
  has_many :sale_requets, through: :cards, source: 'sale'
  has_many :sales, dependent: :destroy
  has_many :bought_cards, through: :sales, source: :card
  #les demandes d'achat de toi, sur des cards non à toi
  has_many :card_requests, through: :sales, source: 'card'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
