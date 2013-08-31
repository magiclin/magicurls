class Url < ActiveRecord::Base
  attr_accessible :description, :name, :url
  validate :url, presence: true
  belongs_to :category
end
