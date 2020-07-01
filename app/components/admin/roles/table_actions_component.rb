class Admin::Roles::TableActionsComponent < ApplicationComponent
  attr_reader :user, :role

  def initialize(user, role)
    @user = user
    @role = role
  end

  private

    def already_has_role?
      user.send("#{role}?") && role_record.persisted?
    end

    def role_record
      user.send(role)
    end

    def add_user_text
      t("admin.#{role.to_s.pluralize}.#{role}.add")
    end

    def add_user_path
      {
        controller: "admin/#{role.to_s.pluralize}",
        action: :create,
        user_id: user
      }
    end
end
