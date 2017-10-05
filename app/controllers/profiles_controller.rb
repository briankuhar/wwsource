class ProfilesController < ApplicationController
  def update
    @user = current_user
    @profile = @user.profile
    
    if @profile.update_attributes!(profile_params)
      flash[:success] = "Success"
      redirect_to edit_profile_path(current_user)
      puts @profile.name + " " + @profile.bio
    else
      render 'edit'
    end
  end

  def edit
    @profile = current_user.profile
    puts @profile.name
    puts User.find(4).profile.name
    puts "---------------"
  end

  def index
  end

  def show
    @user = current_user
    @profile = @user.profile
  end
  
  private
    
    def profile_params
      params.require(:profile).permit(:name, :youtube, :facebook, :twitter, :instagram, :website, :bio, :contact)
    end
end
