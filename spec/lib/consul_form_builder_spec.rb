require "rails_helper"

describe ConsulFormBuilder do
  class DummyModel
    include ActiveModel::Model
    attr_accessor :title, :summary, :terms_of_service, :awesome

    validates :title, presence: true
    validates :terms_of_service, acceptance: true
  end

  let(:builder) { ConsulFormBuilder.new(:dummy, DummyModel.new, ActionView::Base.new, {}) }

  describe "hints" do
    it "does not generate hints by default" do
      render builder.text_field(:title)

      expect(page).not_to have_css ".help-text"
      expect(page).not_to have_css "input[aria-describedby]"
    end

    it "generates text with a hint if provided" do
      render builder.text_field(:title, hint: "Make it quick")

      expect(page).to have_css ".help-text", text: "Make it quick"
      expect(page).to have_css "input[aria-describedby='dummy_title-help-text']"
    end

    it "does not generate a hint attribute" do
      render builder.text_field(:title)

      expect(page).not_to have_css "input[hint]"
    end
  end

  describe "required attributes" do
    it "generates a required attribute for required fields" do
      render builder.text_field(:title)

      expect(page).to have_css "label.required"
      expect(page).to have_css "input[required]"
    end

    it "does not generate a required attribute for optional fields" do
      render builder.text_field(:summary)

      expect(page).not_to have_css "label.required"
      expect(page).not_to have_css "input[required]"
    end

    it "generates a required attribute for checkboxes validating acceptance" do
      render builder.check_box(:terms_of_service)

      expect(page).to have_css "label.required"
      expect(page).to have_css "input[required]"
    end

    it "does not generate a required attribute for optional check boxes" do
      render builder.check_box(:awesome)

      expect(page).not_to have_css "label.required"
      expect(page).not_to have_css "input[required]"
    end
  end

  attr_reader :content

  def render(content)
    @content = content
  end

  def page
    Capybara::Node::Simple.new(content)
  end
end
