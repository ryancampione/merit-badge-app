class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  #skip_before_action :require_active_role, only: [:index]
  before_action :require_admin_view_permission, only: [:admin]
  
  def index
  end
  
  def admin
    
  end
end
