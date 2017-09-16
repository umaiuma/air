class DicChapter < ApplicationRecord
  has_many :dic_groups
  belongs_to :dic_subject
end
