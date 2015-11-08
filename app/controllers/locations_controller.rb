class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new( location_params )
    if @location.save
      flash[:success] = "Successfully created location '#{@location.name}'"
      redirect_to @location
    else
      flash[:error] = @location.errors.full_messages
      render 'new'
    end
  end

  def show
    @location = Location.find( params[:id] )
  end

  def index
    if params[:query]
      @locations = Location.near(params[:query],5)
    else
      @locations = Location.all
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end

end
