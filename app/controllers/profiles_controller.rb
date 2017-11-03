class ProfilesController < ApplicationController
  def update
    @user = current_user
    @profile = @user.profile
    avatar_upload = AvatarUploader.new
    
    if @profile.update_attributes!(profile_params)
      avatar_upload.store!(@profile.avatar) unless @profile.avatar.nil?
      flash[:success] = "Success"
      redirect_to edit_profile_path(current_user)
      puts @profile.name + " " + @profile.bio
    else
      render 'edit'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    puts @profile.name
    puts User.find(4).profile.name
    puts "---------------"
  end

  def index
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
  end
  
  def remove_image
    @profile = Profile.find(params[:id])
    @profile.remove_avatar!
    @profile.save  
    redirect_to edit_profile_path(@profile)
  end
  
  private
    
    def profile_params
      params.require(:profile).permit(:name, :youtube, :facebook, :twitter, :instagram, :website, :bio, :contact, :avatar)
    end
end
