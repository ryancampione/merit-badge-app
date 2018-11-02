class CounselorsController < ApplicationController
  before_action :set_counselor, only: [:show, :edit, :update, :destroy]
  
  # display all merit badges
  def index
    # display all counselors to users with admin or reviewer view
    if current_user.role.permission_view.in?(['reviewer','admin']) then
      @counselors = Counselor.order(:name).paginate(page: params[:page], per_page: 10)
    
    # display only active counselors
    else
     @counselors = Counselor.where(status: "active").order(:name).paginate(page: params[:page], per_page: 10)
    end
  end

  # GET /counselors/1
  def show
  
  end

  # GET /counselors/new
  def new
    @counselor = Counselor.new
    @counselor.status = "active"
  end

  # GET /counselors/1/edit
  def edit
    
  end

  # POST /counselors
  def create
    @counselor = Counselor.new(counselor_params)
    @counselor.created_by = current_user.email
    @counselor.updated_by = current_user.email
    
    if @counselor.save
       flash[:success] = "#{@counselor.name}'s counselor information was successfully added."
       redirect_to counselor_path(@counselor)
    else
       render 'new'
    end
  end

  # PATCH/PUT /counselors/1
  def update
    @counselor.updated_by = current_user.email
    
    if @counselor.update(counselor_params)
       flash[:success] = "#{@counselor.name}'s counselor information was successfully updated."
       redirect_to counselor_path(@counselor)
    else
       render 'edit'
    end
  end

  # DELETE /counselors/1
  # DELETE /counselors/1.json
  def destroy
    @counselor.destroy
    respond_to do |format|
      format.html { redirect_to counselors_url, notice: 'Counselor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counselor
      @counselor = Counselor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def counselor_params
      params.require(:counselor).permit(:name, :email, :phone, :unit_type_id, :unit_number, :help_others, :ypt)
    end
end
