class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      token = issue_token({ 'user_id': @user.id})
      render json: {'token': token }
    else
      render json: {'error': 'Username already exists! Try again.'}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(bankroll: params["bankroll"])
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bankroll)
  end

end
