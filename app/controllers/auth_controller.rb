include Pundit

class AuthController < ApplicationController
  before_action :authenticate_user!
  
  def show 
    @user = User.find_by_id(params[:id]) 
    if @user.nil?
      return render json: {success: false, message: 'User not found!'}, status: :not_found
    end
    
    authorize @user

    render json: {success: true, user: @user}, status: :ok
  end

  def get
    @users = User.all

    if authorize @users 
      render json: {success: true, users: @users}, status: :ok
    else
      render json: {success: false, users: 'Unauthorized'}, status: :unauthorized
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.nil?
      return render json: {success: false, message: 'User not found!'}, status: :not_found
    end

    authorize @user

    if @user.update_attributes(user_params)
      render json: {success: true, user: @user}, status: :ok
    else
      render json: {success: false, user: @user}, status: :unprocessable_entity
    end
  end

  def delete
    @user = User.find_by_id(params[:id])
    if @user.nil?
      return render json: {success: false, message: 'User not found!'}, status: :not_found
    end

    authorize @user

    if @user.destroy
      render json: {success: true, message: 'User deleted succesfuly!'}, status: :ok
    else
      render json: {success: false, message: 'User deleted failure!'}, status: :ok
    end

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end
  
end
