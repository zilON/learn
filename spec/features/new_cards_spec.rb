require "rails_helper"

describe "NewCards" do
  card = FactoryGirl.create(:card)
  it "create card" do
    visit new_card_path
    fill_in "Original text", with: card.original_text
    fill_in "Translated text", with: card.translated_text
    click_button "Create Card"
    expect(page).to have_content(I18n.t("card.created"))
    expect(page).to have_content(card.original_text)
  end
end
