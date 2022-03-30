class Ride < ApplicationRecord
  has_many :passengers
  validates :name, presence: true
  validates :seats, presence: true
  validates :full, inclusion: [true, false]
  
  def self.order_by_created_at
    order(created_at: :desc)
  end 
  
end 
