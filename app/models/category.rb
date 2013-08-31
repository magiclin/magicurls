class Category < ActiveRecord::Base
  attr_accessible :name, :sum
  has_many :urls
end
