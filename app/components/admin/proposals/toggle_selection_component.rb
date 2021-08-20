class Admin::Proposals::ToggleSelectionComponent < ApplicationComponent
  attr_reader :proposal

  def initialize(proposal)
    @proposal = proposal
  end

  private

    def text
      if proposal.selected?
        t("shared.yes")
      else
        t("shared.no")
      end
    end

    def path
      admin_polymorphic_path(proposal, action: :toggle_selection)
    end

    def options
      {
        remote: true,
        method: :patch,
        class: "proposal-toggle-selection",
        "aria-label": label,
        "aria-pressed": proposal.selected?
      }
    end

    def label
      t("admin.proposals.index.select", proposal: proposal.title)
    end
end
