class AuthController < ApplicationController
  def show 
    user = User.find_by_id(params[:id]) 
    if user.nil?
      return render json: {success: false, message: 'User not found!'}, status: :not_found
    end
    
    render json: user
  end

  def list
    users = User.all

    render json: {success: true, users: users}, status: :ok
  end

  def update
    user = User.find_by_id(params[:id])
    if user.nil?
      return render json: {success: false, message: 'User not found!'}, status: :not_found
    end

    if user.update_attributes(user_params)
      render json: {success: true, user: user}, status: :ok
    else
      render json: {success: false, user: user}, status: :unprocessable_entity
    end
  end

  def delete
    user = User.find(params[:id])
    user.destroy

    render json: {success: true, message: 'User deleted succesfuly!'}, status: :ok
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role)
  end


end
