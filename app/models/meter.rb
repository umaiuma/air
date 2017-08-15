class Meter < ApplicationRecord
  belongs_to :user

  def set_score(diff)
    if(self.sign == 0 )
      self.sign = diff
      self.combo =1
    elsif self.sign*diff>0
      self.combo *= 1.25
    else
      self.combo =1
      self.sign =diff
    end

    self.score += 0.07*self.combo*diff

    if(self.score>5)
      self.score =5
    elsif self.score <-5
      self.score = -5
    end
    self.save
    self.user.save


  end
end

