class Part < ApplicationRecord
  belongs_to :pattern
  belongs_to :problem
end
