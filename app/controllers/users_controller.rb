class UsersController < ApplicationController
  def index
  end

  def login
    @token = request.env['omniauth.auth']['credentials']['token']
    @user = User.koala(request.env['omniauth.auth']['credentials'])
  end
end
