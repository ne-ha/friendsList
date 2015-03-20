require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, 
  "775333370063-oq2fmnt778krjk8dc0dmrksdq2465th4.apps.googleusercontent.com", 
  "JExj_3ZvJikWF73MaXN3ZYqM"
end