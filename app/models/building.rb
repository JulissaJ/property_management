class Building < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :buildings

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal, presence: true


end
