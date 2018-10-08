class RoleController < ApplicationController
  
  
  def index
    @role = Role.paginate(page: params[:page], per_page: 5)
  end
  
end
