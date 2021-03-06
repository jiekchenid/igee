class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  # include AuthenticatedSystem
  respond_to :html
  before_filter :login_required, :only=> [:edit]
  before_filter :find_user, :except => [:new,:create,:edit,:welcome,:index]

  # render new.rhtml
  def new
    redirect_to :root if logged_in?
    @user = User.new
    render :layout => false if params[:layout] == 'false'
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      flash[:dialog] = "<a href=#{welcome_users_path} class='open_dialog' title='欢迎'>欢迎</a>"
      redirect_back_or_default('/')
    else
      render :action => 'new' 
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user.update_attributes(params[:user])
    redirect_to :back
  end
  
  def index
    redirect_back_or_default('/')
  end
  
  def show
    @records = @user.records
    @plans = @user.plans.select{|p| p.record.nil?}
    @followers = @user.followers
  end
  
  def welcome
    if params[:layout] == 'false'
      render :layout => false
    end  
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
