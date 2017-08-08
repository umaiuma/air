class Chapter < ApplicationRecord
  has_many :patterns
  belongs_to :subject

end
