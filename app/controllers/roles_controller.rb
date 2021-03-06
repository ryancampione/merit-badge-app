class RolesController < ApplicationController
 
  # run the set_role method first for these methods
  before_action :set_role, only: [:edit, :update, :show, :destroy]
  before_action :require_admin_create_permission, only: [:new, :create]
  before_action :require_admin_view_permission
  before_action :require_admin_update_permission, only: [:edit, :update]
  before_action :require_admin_delete_permission, only: [:destroy]
  
  # display all roles
  def index
    @roles = Role.order(:title).paginate(page: params[:page], per_page: 5)
  end
  
   # new role view
   def new
      @role = Role.new
   end
   
   # create a new role in the Role table
   def create
      @role = Role.new(role_params)
      @role.updated_by = current_user.email
      
      if @role.save
         flash[:success] = "Role was successfully created"
         redirect_to roles_path
      else
         render 'new'
      end
   end
  
  # display a role
  def edit
    @permission_levels = Role.permission_levels
  end
  
  # update a role
  def update
    @role.updated_by = current_user.email
    
    if @role.update(role_params)
       flash[:success] = "Role was successfully updated"
       redirect_to roles_path
    else
       render 'edit'
    end
      
  end
  
  # delete a role
  def destroy
    
    if @role.destroy
      flash[:success] = "Role was successfully deleted"
    else
      flash[:danger] = "Role cannot be deleted"
    end
      
    redirect_to roles_path
  end
  
  private
    
    def role_params
      params.require(:role).permit(
        :title, 
        :description,
        :permission_create,
        :permission_view,
        :permission_update,
        :permission_delete,
        :permission_send_notifications,
        :default,
        :active
      )
    end
  
    def set_role
      @role = Role.find(params[:id])
    end
  
end
