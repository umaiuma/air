class Pattern < ApplicationRecord
  has_many :parts
  has_may :problems, through: :parts
end
