class UsersController < ApplicationController
 

  def index
    @user = User.new
    @book = Book.new
    @users = User.all
  end
  	
  
  def show
    @user = User.find(params[:id])
    @book =Book.new
    @books = @user.books
  end
  

    def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
    redirect_to user_path(current_user.id)
    end
    end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  else
    render :edit
  end
  end
  

  def destroy
    #if reset_session
    #redirect_to root_path, notice: "Signed out successfully."
  #else render :root_path
  #end
  end



 private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end