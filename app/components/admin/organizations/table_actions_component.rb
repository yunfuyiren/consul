class Admin::Organizations::TableActionsComponent < ApplicationComponent
  delegate :can?, to: :controller
  attr_reader :organization

  def initialize(organization)
    @organization = organization
  end
end
