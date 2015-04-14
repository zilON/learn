include UserHelper
feature "user profile" do
  let!(:user) { FactoryGirl.create(:user) }
  before {
    login
  }
  scenario "login" do
    expect(page).to have_content("Nothing to review")
  end

  scenario "review" do
    click_link "Edit Profile"
    expect(page).to have_content("Editing user")
  end

  scenario "wrong password change" do
    click_link "Edit Profile"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: "some"
    click_button "Update User"
    expect(page).to have_content("errors")
  end

  scenario "correct password change" do
    click_link "Edit Profile"
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    expect(page).to have_content("Editing user")
  end
end
