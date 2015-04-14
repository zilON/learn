include UserHelper
feature "Cards CRUD" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:card) { FactoryGirl.create(:card, :to_check, user_id: user.id) }
  before{
    login
  }
  scenario "create user card" do
    visit new_card_path
    fill_in "Original text", with: "Some original text"
    fill_in "Translated text", with: "Some Translated text"
    click_button "Create Card"
    expect(page).to have_content("Some original text" "Some Translated text")
  end

  scenario "update user card" do
    visit "cards/6"
    click_link "Edit"
    fill_in "Translated text", with: "Some diferent Translated text"
    click_button "Update Card"
    expect(page).to have_content("Some diferent Translated text")
  end

  scenario "delete user card" do
    visit "cards/7"
    click_link "Delete"
    expect(page).to have_content(I18n.t("card.deleted"))
  end
end
