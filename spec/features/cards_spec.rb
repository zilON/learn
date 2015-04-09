include UserHelper
feature "Review a card" do
  let!(:user) { FactoryGirl.create(:user)}
  let!(:card) {  FactoryGirl.create(:card, :to_check) }
  before{
    visit root_path
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
