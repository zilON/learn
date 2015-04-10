module UserHelper
  def login
    visit root_path
    click_link "Login"
    fill_in "email", with: "some@email.com"
    fill_in "password", with: "123456"
    click_button "Login"
    visit root_path
  end
  def new_card
    visit new_card_path
    fill_in "Original text", with: "some@email.com"
    fill_in "Translated text", with: "123456"
    click_button "Create Card"
  end
end
