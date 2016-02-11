class PrivateNotesController < ApplicationController

  before_filter :require_current_user
  before_filter :require_owner, :except => [:new, :create, :show]

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

  def edit
    @note = PrivateNote.find(params[:id])
  end

  def update
    @location = Location.find(params[:location_id])
    @note = PrivateNote.find(params[:id])
    if @note.update_attributes( private_note_params )
      redirect_to @note.location
    else
      @location = Location.find(params[:location_id])
      @note = PrivateNote.find(params[:id])
      flash.now[:error] = @note.errors.full_messages
      render 'edit'
    end
  end

  private

  def private_note_params
    params.require(:private_note).permit(:text)
  end

  def require_owner
    @location = Location.find(params[:location_id])
    @private_note = PrivateNote.find( params[:id] )
    redirect_to @location unless @private_note.readable_by?( @current_user )
  end

end
