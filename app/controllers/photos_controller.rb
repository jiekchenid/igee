class PhotosController < ApplicationController
  before_filter :login_required,   :except => [:show]
  before_filter :find_photo,       :except => [:create]
  before_filter :check_permission, :only => [:destroy,:update]
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.user = current_user
    @photo.save
    redirect_to :back
  end

  def update
    @photo.update_attributes(params[:photo])
    redirect_to :back
  end

  def destroy
    @photo.destroy
    redirect_to :back
  end

  def show
    render :layout => false if params[:layout] == 'false'
  end
  
  private
  
  def find_photo
    @photo = Photo.find(params[:id])
  end
  
  def check_permission
    redirct_to :back unless @photo.can_edit_by?(current_user) 
  end
end
