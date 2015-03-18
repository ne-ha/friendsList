require "omnicontacts"

Rails.application.middleware.use OmniContacts::Builder do
  importer :gmail, "775333370063-7v8nubvujqsirviug5fsr0kr82mpu3th.apps.googleusercontent.com", "
a0Vvk9C0OFCi92hOmZmhOLmW", {:redirect_path => "/contacts/gmail/callback"}
end