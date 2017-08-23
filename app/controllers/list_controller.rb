class ListController < ApplicationController
  before_action :require_user

  def index
  end
  def index2
  end
  def index3
  end
  def tree
    @user = User.find(session[:user_id])



  end
  def index4
    @user = User.find(session[:user_id])
  end
  def index5
    @user = User.find(session[:user_id])

  end
end
