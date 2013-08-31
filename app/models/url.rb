class Url < ActiveRecord::Base
  attr_accessible :description, :name, :url
  belongs_to :category
end
