class PublicTipsController < ApplicationController

  before_filter :check_tip_ownership

  def new
    @tip = PublicTip.new
  end

  def create
    @tip = PublicTip.new( tip_params )
    if @tip.save
      redirect_to @tip.location
    else
      flash[:error] = @tip.errors.full_messages
      render 'new'
    end
  end

  def edit
    # @tip exists due to check_tip_ownership before_filter
  end

  def update
  end

  private

  def tip_params
    params.require(:public_tip).permit(:tip_text)
  end

  def check_tip_ownership
    @tip = PublicTip.find( params[:id] )
    if @tip.user != current_user
      flash[:error] = "You don't have permission to edit that tip"
      redirect_to @tip.location
    end
  end

end
