require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, 
  "775333370063-lc2d7dpgmoohfv95anhtm5iaubhlfkra.apps.googleusercontent.com", 
  "ZWR1BRVG_Xs3AW-IGGbJase7"
end