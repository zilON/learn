include UserHelper
feature "Review a card" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:card) { FactoryGirl.create(:card, :to_check, user_id: user.id) }
  before{
    login
  }
  describe "review errors" do
    scenario "shows error with wrong text used" do
      fill_in "Original text", with: "some text"
      click_button "Update Card"
      expect(page).to have_content(I18n.t("card.review_error"))
    end
    scenario "shows error with translated_text used" do
      fill_in "Original text", with: card.translated_text
      click_button "Update Card"
      expect(page).to have_content(I18n.t("card.review_error"))
    end
  end
  scenario "shows sccess message and updates review_date" do
    fill_in "Original text", with: card.original_text
    click_button "Update Card"
    expect(page).to have_content(I18n.t("card.review_success"))
  end

end
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
