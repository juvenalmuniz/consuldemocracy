require "rails_helper"

describe Shared::AgreeWithTermsOfServiceFieldComponent do
  before do
    dummy_model = Class.new do
      include ActiveModel::Model
      attr_accessor :terms_of_service
    end

    stub_const("DummyModel", dummy_model)
  end

  let(:form) { ConsulFormBuilder.new(:dummy, DummyModel.new, ApplicationController.new.view_context, {}) }
  let(:component) { Shared::AgreeWithTermsOfServiceFieldComponent.new(form) }

  it "contains links that open in a new window" do
    render_inline component

    expect(page).to have_css "a[target=_blank]", count: 2
  end
end
