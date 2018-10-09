class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  
  def require_active_role
    if !current_user.role.active
      flash[:danger] = "Your user role is inactive."
      redirect_to root_path
    end
  end
  
  def require_admin_create_permission
    if current_user.role.permission_create != "admin"
      flash[:danger] = "You do not have the proper permissions to preform this action: #{current_user.role.permission_create} permission to create."
      redirect_to root_path
    end
  end

  
  def require_admin_view_permission
    if current_user.role.permission_view != "admin"
      flash[:danger] = "You do not have the proper permissions to preform this action: #{current_user.role.permission_view} permission to view."
      redirect_to root_path
    end
  end

  
  def require_admin_update_permission
    if current_user.role.permission_update != "admin"
      flash[:danger] = "You do not have the proper permissions to preform this action. Permission to update: #{current_user.role.permission_update}"
      redirect_to root_path
    end
  end

  
  def require_admin_delete_permission
    if current_user.role.permission_delete != "admin"
      flash[:danger] = "You do not have the proper permissions to preform this action. Permission to delete: #{current_user.role.permission_delete}"
      redirect_to root_path
    end
  end
  
  
  
  
  
  
end
