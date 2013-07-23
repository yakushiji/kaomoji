class EmoticonsController < ApplicationController
  before_filter :signed_in_user, only:[:create, :destroy]

  def index
  end

  def create
    @emoticon = current_user.emoticons.build(params[:emoticon])
    if @emoticon.save
      flash[:success] = "Emoticon created"
      redirect_to root_url
    else
      render 'home/index'
    end
  end

  def destroy
  end
end
