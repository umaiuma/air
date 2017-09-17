class Exam < ApplicationRecord
  has_many :subjects
  belongs_to :user
  has_many :meters
  has_many :history_problems





end
