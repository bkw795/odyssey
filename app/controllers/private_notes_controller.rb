class PrivateNotesController < ApplicationController

  before_filter :require_current_user

  def show
    @note = PrivateNote.find( params[:id] )
    if @note.user != current_user
      flash[:error] = "You don't have permission to view the requested note."
      redirect_to @note.location
    end
  end

  def new
    @location = Location.find(params[:location_id])
    @note = PrivateNote.new
  end

  def create
    @location = Location.find(params[:location_id])
    @note = PrivateNote.new( private_note_params )
    @note.user = @current_user
    @note.location = @location
    if @note.save
      redirect_to @note.location
    else
      @location = Location.find(params[:location_id])
      flash.now[:error] = @note.errors.full_messages
      render 'new'
    end
  end

  private

  def private_note_params
    params.require(:private_note).permit(:text)
  end

end
