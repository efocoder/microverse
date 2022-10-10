require 'rails_helper'

RSpec.describe "Users actions", type: :feature do
  let(:account) { FactoryBot.create(:account) }
  let(:user) { FactoryBot.create(:user) }

  describe "/users" do
    it "renders success response when signed in" do
      sign_in(account)
      visit users_url

      expect(page.status_code).to eq 200
      expect(page).to have_selector 'table.table'
      expect(page).to have_content 'All'
      expect(page).to have_css ".page-link"
    end

    it "redirects to login page" do
      visit users_url

      expect(page.current_url).to eq new_account_session_url
      expect(page).to have_content "Email"
      expect(page).to have_field "Email"
      expect(page).to have_field "Password"
      expect(page).to have_field "Remember me"
      expect(page).to have_button "Log in"

    end
  end

  describe "/users/:id" do
    before do
      sign_in(account)
      visit visit "/users/#{user.id}"
    end

    it "finds user name on the page" do
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
    end
  end
end
