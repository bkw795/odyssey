class AtlasesController < ApplicationContoller

  def show
    @atlas = Atlas.find( params[:id] )
  end

  def index
    @atlases = Atlas.all
  end

end