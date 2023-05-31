require "rails_helper"

describe Admin::Budgets::ActionsComponent, controller: Admin::BaseController do
  before { sign_in(create(:administrator).user) }

  let(:budget) { create(:budget) }
  let(:component) { Admin::Budgets::ActionsComponent.new(budget) }

  describe "Create booths button" do
    it "is rendered for budgets without polls" do
      render_inline component

      expect(page.find("form[action*='polls'][method='post']")).to have_button "Create booths"
    end

    it "is not rendered for finished budgets without polls" do
      budget.update!(phase: "finished")

      render_inline component

      expect(page).not_to have_css "form[action*='polls']"
      expect(page).not_to have_button "Create booths"
    end

    it "is not rendered for budgets with polls" do
      budget.poll = create(:poll, budget: budget)

      render_inline component

      expect(page).not_to have_css "form[action*='polls']"
      expect(page).not_to have_button "Create booths"
    end

    it "is disabled when the polls feature is disabled" do
      Setting["process.polls"] = false

      render_inline component

      expect(page).to have_css ".ballots-link[disabled]"
      expect(page).to have_link(href: "/admin/settings#tab-participation-processes")
    end

    it "is enabled when the polls feature is enabled" do
      Setting["process.polls"] = true

      render_inline component

      expect(page).not_to have_css ".ballots-link[disabled]"
      expect(page).not_to have_link "settings configuration"
    end
  end
end
