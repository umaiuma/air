class Pattern < ApplicationRecord
  belongs_to :chapter
  has_many :parts
  has_many :problems, through: :parts
end
