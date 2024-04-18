require "rails_helper"

describe Admin::Proposals::ToggleSelectionComponent, controller: Admin::BaseController do
  describe "aria-pressed attribute" do
    it "is true for selected proposals" do
      proposal = create(:proposal, :selected)

      render_inline Admin::Proposals::ToggleSelectionComponent.new(proposal)

      expect(page).to have_css "[aria-pressed=true]"
    end

    it "is false for not selected proposals" do
      proposal = create(:proposal)

      render_inline Admin::Proposals::ToggleSelectionComponent.new(proposal)

      expect(page).to have_css "[aria-pressed=false]"
    end
  end
end
