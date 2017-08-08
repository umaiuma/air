class Subject < ApplicationRecord
  has_many :chapters
  belongs_to :exam


end
