class UsersController < ApplicationController
  require 'koala'
  
  def index
  end

  def login
    # @token = request.env['omniauth.auth']['credentials']['token']
    # @user = User.koala(request.env['omniauth.auth']['credentials'])
    # @graph = Koala::Facebook::API.new(@token)
    # @friends = @graph.get_connections("me", "friends")
    auth = request.env["omniauth.auth"]
    session['fb_auth'] = auth
    session['fb_access_token'] = auth['credentials']['token']
    binding.pry
    if session['fb_access_token'].present?
      graph = Koala::Facebook::GraphAPI.new(session['fb_access_token']) # Note that i'm using session here
      @profile_image = graph.get_picture("me")
      @fbprofile = graph.get_object("me")
      @friends = graph.get_connections("me", "friends")
    end
  end
end
