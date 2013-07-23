class HomeController < ApplicationController
  def index
    @emoticon = current_user.emoticons.build if signed_in?
  end

  def show
    @user = User.find(params[:id])
    @emoticons = @user.emoticons.paginate(page: params[:page])
  end
end
