class UsersController < ApplicationController
  def index
  end

  def login
    @token = request.env['omniauth.auth']['credentials']['token']
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    @graph = Koala::Facebook::API.new(@token)
    @friends = @graph.get_connections("me", "friends")
  end
end
