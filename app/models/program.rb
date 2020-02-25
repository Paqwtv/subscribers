class Program < ApplicationRecord
  has_many :subscribes
  has_many :users, through: :subscribes
  accepts_nested_attributes_for :subscribes, allow_destroy: true
end
