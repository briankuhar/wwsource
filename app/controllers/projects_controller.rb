class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 9)
    
    if params[:search]
      @projects = Project.search(params[:search]).where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 9)
    else
      @projects = Project.where("user_id = ?", current_user.id).paginate(:page => params[:page], :per_page => 9)
    end
    
    if params[:sort_param]
      @projects = @projects.order("#{params[:sort_param]}")
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @materials = @project.materials.all
    @creator = User.find(@project.user_id)
    
    @iscreator = (@creator == current_user)
    puts @iscreator
  end

  # GET /projects/new
  def new
    @user = current_user
    @project = @user.projects.new
    @difficulty_list = DifficultyLevel.all
    @materials_list = MaterialType.all
  end

  # GET /projects/1/edit
  def edit
    
    @difficulty_list = DifficultyLevel.all
    @materials_list = MaterialType.all
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = current_user
    @project = @user.projects.new(project_params)
    
    unless @project.youtube_link.nil?
      @project.youtube_id = parse_youtube(@project.youtube_link)
    end

    if @project.save!
      flash[:success] = "Project created successfully"
      redirect_to project_path(@project)
    else
      flash[:error] = "There was a problem with your submission"
      redirect_to edit_project_path(@project)
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.youtube_id = parse_youtube(@project.youtube_link)
    if @project.update(project_params)
      flash[:success] = "Project successfully updated"
      redirect_to project_path(@project)
    else
      flash[:error] = "There was a problem with your upload"
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
  
  def parse_youtube url
    unless url == '' || url.nil?
     regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
     url.match(regex)[1]
    end
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:project_name, :project_description, :project_difficulty, :youtube_link, :youtube_id, :instructions, :user_id, 
                materials_attributes: [:id, :material, :matl_type, :qty, :notes, :_destroy])
    end
    

end
