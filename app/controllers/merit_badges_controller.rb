class MeritBadgesController < ApplicationController

  before_action :set_merit_badge, only: [:edit, :update, :show, :destroy]
  before_action :require_admin_create_permission, only: [:new, :create]
  before_action :require_admin_update_permission, only: [:edit, :update]
  before_action :require_admin_delete_permission, only: [:destroy]
  
  # display all merit badges
  def index
    # display all merit badges to users with admin view
    if current_user.role.permission_view == 'admin' then
      @merit_badges = MeritBadge.order(:title).paginate(page: params[:page], per_page: 10)
    
    # display only active merit badges
    else
     @merit_badges = MeritBadge.where(active: true).order(:title).paginate(page: params[:page], per_page: 10)
    end
  end
  
  def show
    
  end
  
  # new merit badge view
  def new
    @merit_badge = MeritBadge.new
    @merit_badge.active = true
  end
   
  # create a new merit badge
  def create
    @merit_badge = MeritBadge.new(merit_badge_params)
    @merit_badge.updated_by = current_user.email
    
    if @merit_badge.save
       flash[:success] = "The #{@merit_badge.title} merit badge was successfully created."
       redirect_to merit_badge_path(@merit_badge)
    else
       render 'new'
    end
  end
  
  # display edit merit badge view
  def edit
    
  end
  
  # update a merit badge
  def update
    @merit_badge.updated_by = current_user.email
    
    if @merit_badge.update(merit_badge_params)
       flash[:success] = "The #{@merit_badge.title} merit badge was successfully updated."
       redirect_to merit_badge_path(@merit_badge)
    else
       render 'edit'
    end
  end
  
  # delete merit badge
  def destroy
    if @merit_badge.destroy
      flash[:success] = "Merit badge was successfully deleted."
    else
      flash[:danger] = "Merit badge could not be deleted."
    end
      
    redirect_to merit_badges_path
  end
  
  private
    
    def merit_badge_params
      params.require(:merit_badge).permit(
        :title, 
        :special_counselor_requirements,
        :img_url,
        :eagle_required,
        :active
      )
    end
  
    def set_merit_badge
      @merit_badge = MeritBadge.find(params[:id])
    end
  
end

