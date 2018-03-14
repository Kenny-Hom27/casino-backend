class AuthController < ApplicationController

  def login
    u = User.find_by(username: params[:username])
    if u && u.authenticate(params[:password])
      token = issue_token({ 'user_id': u.id })
      render json: {'token': token, user: u, bankroll: u.bankroll}
    else
      render json: {'error': 'Could not find or authenticate user'}, status: 401
    end
  end

  def current
    if !current_user.present?
      render json: {error: 'No user id presenttt'}
    else
      render json: current_user
    end
  end

end
