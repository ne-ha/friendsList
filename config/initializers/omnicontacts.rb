require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, 
  "775333370063-9569nc7vg2ap5hqhvit40l8u95oip1ok.apps.googleusercontent.com", 
  "1wwbpvxtByBeWXQFzN_ZI7mo"
end