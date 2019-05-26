class AuthController < ApplicationController
  def show 
    usr = User.find_by_id(params[:id]) 
    if usr.nil?
      return render json: {result: false, message: 'Record not found!'}, status: 404
    end
    render json: usr
  end

  def list
    usrs = User.all
    render json: usrs
  end

  def update

  end

  def delete
    usr = User.find(params[:id])
    usr.destroy
    render json: 'sucess'

  end


end
