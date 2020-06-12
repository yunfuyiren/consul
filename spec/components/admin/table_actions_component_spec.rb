require "rails_helper"

module Admin
  describe TableActionsComponent, type: :component do
    let(:banner) { create(:banner) }

    it "renders a link to edit a record by default" do
      render_inline TableActionsComponent.new(banner)

      expect(page).to have_link "Edit"
    end

    it "renders a link to destroy a record by default" do
      render_inline TableActionsComponent.new(banner)

      expect(page).to have_link "Delete"
    end

    context "actions parameter is passed" do
      it "renders a link to edit a record if passed" do
        render_inline TableActionsComponent.new(banner, actions: [:edit])

        expect(page).to have_link "Edit"
        expect(page).not_to have_link "Delete"
      end

      it "renders a link to destroy a record if passed" do
        render_inline TableActionsComponent.new(banner, actions: [:destroy])

        expect(page).to have_link "Delete"
        expect(page).not_to have_link "Edit"
      end
    end

    it "allows custom texts for actions" do
      render_inline TableActionsComponent.new(banner, edit_text: "change banner", destroy_text: "annihilate")

      expect(page).to have_link "annihilate"
      expect(page).to have_link "change banner"
      expect(page).not_to have_link "delete"
      expect(page).not_to have_link "Edit"
    end

    it "allows custom URLs" do
      render_inline TableActionsComponent.new(edit_path: "/myedit", destroy_path: "/mydestroy")

      expect(page).to have_link "Edit", href: "/myedit"
      expect(page).to have_link "Delete", href: "/mydestroy"
    end

    it "allows custom confirmation text" do
      render_inline TableActionsComponent.new(banner, destroy_confirmation: "Are you mad? Be careful!")

      expect(page).to have_css "a[data-confirm='Are you mad? Be careful!']"
    end

    it "allows custom content" do
      render_inline TableActionsComponent.new(banner) do
        "<a href='/'>Main</a>".html_safe
      end

      expect(page).to have_link "Main", href: "/"
      expect(page).to have_link "Edit"
    end
  end
end
