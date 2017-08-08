class Pattern < ApplicationRecord

  has_many :parts
  has_many :problems, through: :parts


end
