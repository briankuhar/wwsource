class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @materials = @project.materials.all
  end

  # GET /projects/new
  def new
    @user = current_user
    @project = @user.projects.new
    @list = DifficultyLevel.all
  end

  # GET /projects/1/edit
  def edit
    
    @list = DifficultyLevel.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = current_user
    @project = @user.projects.new(project_params)

    if @project.save!
      flash[:success] = "Project created successfully"
      redirect_to edit_project_path(@project)
    else
      flash[:error] = "There was a problem with your upload"
      render 'new'
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if @project.update(project_params)
      flash[:success] = "Project successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :project_description, :project_difficulty, :user_id, 
                materials_attributes: [:id, :material, :matl_type, :qty, :notes, :_destroy])
    end
    

end
