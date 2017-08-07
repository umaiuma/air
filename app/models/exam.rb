class Exam < ApplicationRecord
  has_many :subjects
  belongs_to :user
end
