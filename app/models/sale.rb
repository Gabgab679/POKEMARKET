class Sale < ApplicationRecord
  belongs_to :card
  belongs_to :user # Buyer

end
