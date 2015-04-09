module UserHelper
  def login
    click_link 'Login'
    fill_in 'email', with: "some@email.com"
    fill_in 'password', with: "123456"
    click_button 'Login'
    visit cards_path
    save_and_open_page
  end
end
