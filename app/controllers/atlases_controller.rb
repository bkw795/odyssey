class AtlasesController < ApplicationController

  before_filter :require_current_user
  before_filter :require_owner

  def show
    @atlas = Atlas.find( params[:id] )
  end

  def index
    if logged_in?
      redirect_to @current_user.atlas
    else
      redirect_to signin_path
    end
  end

private

  # Can use @current_user here because the require_current_user before_filter will make sure they exist
  def require_owner
    @atlas = Atlas.find(params[:id])
    if !@atlas.owned_by?(@current_user )
      flash[:error] = "You can only view your own atlas"
      redirect_to @current_user.atlas
    end
  end

end
