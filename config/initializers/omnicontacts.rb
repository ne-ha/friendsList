require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "775333370063-v8d4p2rvcbjemhlnjt34u3vm5ekgm88g.apps.googleusercontent.com", "
xR26XUNhcx6QnGJv8wgl7Zfl", {:redirect_path => "/oauth2callback", :ssl_ca_file => "/etc/ssl/certs/curl-ca-bundle.crt"}
end