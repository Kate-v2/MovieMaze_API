

class SessionsController < ApplicationController

  def create
    input = parse_params
    @user = User.find_by_username(input[:username])
    if @user && @user.authenticate(input[:password])
      login
      render_login
    else
      head 400
    end
  end

  private

  # I don't think I really need this because
  # I'm using the values I want explicitly
  def parse_params
    input = params.dup
    input.slice!(:username, :password)
    return input
  end

  def login
    session[:user] = @user.token
  end

  def render_login
    response.status = 200
    render json: LoginSerializer.new(@user)
  end



end
