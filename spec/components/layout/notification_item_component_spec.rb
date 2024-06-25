require "rails_helper"

describe Layout::NotificationItemComponent do
  it "is not rendered without user" do
    render_inline Layout::NotificationItemComponent.new(nil)

    expect(page).not_to be_rendered
  end

  it "is rendered with user" do
    render_inline Layout::NotificationItemComponent.new(create(:user))

    expect(page).to be_rendered
  end
end
