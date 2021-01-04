class User < ApplicationRecord
  has_many :items
  has_many :purchase
  has_many :address
end
