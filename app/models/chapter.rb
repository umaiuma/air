class Chapter < ApplicationRecord
  has_many :groups
  belongs_to :subject

end
