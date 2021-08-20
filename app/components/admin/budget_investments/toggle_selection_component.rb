class Admin::BudgetInvestments::ToggleSelectionComponent < ApplicationComponent
  attr_reader :investment
  delegate :can?, to: :controller
  delegate :selected?, to: :investment

  def initialize(investment)
    @investment = investment
  end

  private

    def budget
      investment.budget
    end

    def text
      if selected?
        t("admin.budget_investments.index.selected")
      else
        t("admin.budget_investments.index.select")
      end
    end

    def path
      toggle_selection_admin_budget_budget_investment_path(
        budget,
        investment,
        filter: params[:filter],
        sort_by: params[:sort_by],
        min_total_supports: params[:min_total_supports],
        max_total_supports: params[:max_total_supports],
        advanced_filters: params[:advanced_filters],
        page: params[:page]
      )
    end

    def html_class
      if selected?
        "button small hollow expanded"
      else
        "button small expanded"
      end
    end
end
