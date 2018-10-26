class MeritBadgesController < ApplicationController
    before_action :set_merit_badge, only: [:edit, :update, :show, :destroy]
  
  # display all merit badges
  def index
    # display all merit badges to users with admin view
    if current_user.role.permission_view == 'admin' then
      @merit_badges = MeritBadge.order(:title).paginate(page: params[:page], per_page: 5)
    
    # display only active merit badges
    else
     @merit_badges = MeritBadge.where(active: true).order(:title).paginate(page: params[:page], per_page: 5)
    end
  end
  
  def show
    
  end
  
   # new merit badge view
   def new
      @merit_badge = MeritBadge.new
   end
   
   # create a new merit badge
   def create
    @merit_badge = MeritBadge.new(merit_badge_params)
    @merit_badge.updated_by = current_user.email
    
    if @merit_badge.save
       flash[:success] = "Merit badge #{@merit_badge.title} was successfully created"
       redirect_to merit_badges_path
    else
       render 'new'
    end
  end
  
  def destroy
    
  end
  
  private
    
    def merit_badge_params
      params.require(:merit_badge).permit(
        :title, 
        :eagle_required,
        :special_counselor_requirements,
        :active
      )
    end
  
    def set_merit_badge
      @merit_badge = MeritBadge.find(params[:id])
    end
  
end

