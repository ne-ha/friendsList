require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, 
  "775333370063-c4ba2sll69vqrm9bjml3nvt6agjvb9n4.apps.googleusercontent.com", 
  "u6oqNSIZQw0LjQu00rGH5a2e"
end