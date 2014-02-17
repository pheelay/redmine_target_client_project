require 'redmine'
require 'mail_handler_patch'

Redmine::Plugin.register :redmine_target_client_project do
  name 'Redmine Target Client Project plug-in'
  author 'Phil Franks'
  description 'New tickets from incoming emails will be created in a project the sender is a member of.'
  version '0.1.0'
  url 'http://www.franks.ie/'
  author_url 'http://www.franks.ie/'
  
  MailHandler.send :include, RedmineTargetClientProject::MailHandlerPatch
end
