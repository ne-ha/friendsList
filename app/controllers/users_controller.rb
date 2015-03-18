class UsersController < ApplicationController
  require 'koala'

  def index
    @contacts = request.env['omnicontacts.contacts']
    respond_to do |format|
      format.html
    end
  end

  def callback
    @contacts = request.env['omnicontacts.contacts']
    @user = request.env['omnicontacts.user']
    puts "List of contacts of #{@user[:name]} obtained from #{params[:importer]}:"
    @contacts.each do |contact|
      puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
    end
  end
  
  def failure
  end

  #for facebook  
  def login
    # @token = request.env['omniauth.auth']['credentials']['token']
    # @user = User.koala(request.env['omniauth.auth']['credentials'])
    # @graph = Koala::Facebook::API.new(@token)
    # @friends = @graph.get_connections("me", "friends")
    auth = request.env["omniauth.auth"]
    session['fb_auth'] = auth
    session['fb_access_token'] = auth['credentials']['token']
    if session['fb_access_token'].present?
      graph = Koala::Facebook::GraphAPI.new(session['fb_access_token']) # Note that i'm using session here
      @profile_image = graph.get_picture("me")
      @fbprofile = graph.get_object("me")
      @friends = graph.get_connections("me", "friends")
    end
  end
end
