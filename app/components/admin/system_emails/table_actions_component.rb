class Admin::SystemEmails::TableActionsComponent < ApplicationComponent
  attr_reader :system_email_title, :system_email_actions

  def initialize(system_email_title, system_email_actions)
    @system_email_title = system_email_title
    @system_email_actions = system_email_actions
  end
end
