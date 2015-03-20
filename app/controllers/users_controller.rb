class UsersController < ApplicationController
  require 'koala'

  def index
    contacts_info
    @contacts = Kaminari.paginate_array(session['name_email']).page(params[:page]).per(3)
    respond_to do |format|
      format.html
    end
  end

  def contacts_info
    @all_contacts = request.env['omnicontacts.contacts']
    if @all_contacts.nil?
      return nil
    else
      session['name_email'] = @all_contacts.map{|c| [c[:name], c[:email]] }
      return session['name_email']
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
    auth = request.env["omniauth.auth"]
    session['fb_auth'] = auth
    session['fb_access_token'] = auth['credentials']['token']
    if session['fb_access_token'].present?
      graph = Koala::Facebook::GraphAPI.new(session['fb_access_token']) 
      @user = User.koala(request.env['omniauth.auth']['credentials'])
      @friends = graph.get_connections("me", "friends")
    end
  end
end
