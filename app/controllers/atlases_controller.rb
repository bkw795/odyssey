class AtlasesController < ApplicationController

  def show
    @atlas = Atlas.find( params[:id] )
  end

  def index
    if logged_in?
      redirect_to current_user.atlas
    else
      redirect_to signin_path
    end
  end

end
