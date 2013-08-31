class Category < ActiveRecord::Base
  attr_accessible :name, :sum
  validates :name, presence: true
  has_many :urls
end
