class AtlasPagesController < ApplicationController

  before_action :ensure_user, :only => [:edit, :update, :destroy]
  before_action :ensure_viewable, :only => :show

  def new
    @atlas_page = AtlasPage.new
  end

  def create
    @atlas_page = AtlasPage.new( atlas_page_params )
    if @atlas_page.valid?
      @current_user.atlas.atlas_pages.create( atlas_page_params )
      flash[:success] = "Atlas page #{params[:atlas_page][:name]} created successfully"
      redirect_to @current_user.atlas
    else
      flash[:error] = @atlas_page.errors.full_messages
      render 'new'
    end
  end

  def edit
    @atlas_page = AtlasPage.find(params[:id])
  end

  def update
    @atlas_page = AtlasPage.find(params[:id])
    if @atlas_page.update_attributes( atlas_page_params )
      flash[:success] = "Atlas page #{params[:atlas_page][:name]} updated successfully"
      redirect_to @atlas_page
    else
      flash.now[:error] = @atlas_page.errors.full_messages
      render 'edit'
    end    
  end

  def show
    @atlas_page = AtlasPage.find(params[:id])
  end

  def destroy

  end

  private
    def atlas_page_params
      params.require(:atlas_page).permit(:name,:description)
    end

    def ensure_user
      @atlas_page = AtlasPage.find(params[:id])
      return false if !(@atlas_page.owner == @current_user)
    end

    def ensure_viewable
      @atlas_page = AtlasPage.find(params[:id])
      if !@atlas_page.can_be_read_by?( @current_user )
        flash[:error] = "You don't have permission to view that atlas page"
        redirect_to root_path
      end
    end
end
