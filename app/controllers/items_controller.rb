class ItemsController < ApplicationController
  # ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移させる
  before_action :authenticate_user!, except: [:index, :show]
  def index
    
  end
end
