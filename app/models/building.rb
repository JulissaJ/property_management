class Building < ActiveRecord::Base
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal, presence: true
end
