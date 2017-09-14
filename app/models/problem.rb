class Problem < ApplicationRecord
  has_many :parts
  has_many :patterns, through: :parts


end
