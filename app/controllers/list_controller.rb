class ListController < ApplicationController
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
end
