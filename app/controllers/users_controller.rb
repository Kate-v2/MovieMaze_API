

class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    input = parse_params
    response.status = 400 if User.find_by_username(input[:username])
    begin
      @user = User.make_user(input)
    rescue
      head 400
    else
      login
      render_new_user
    end
  end


  private

  def parse_params
    input = params.dup
    input.slice!(:email, :password, :password_confirmation, :username)
    return input
  end

  def login
    session[:user] = @user.token
  end

  def render_new_user
    response.status = 201
    render json: NewUserSerializer.new(@user)
  end


end
