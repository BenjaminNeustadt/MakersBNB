feature "login page" do
#  TDD makes below obsolete
#  context "basic connection server/page connection test" do
#    it "Returns a basic text message initially to confirm server connection" do
#      visit('/makersbnb/login')
#      expect(page).to have_content "Login page"
#    end
#  end
  context "basic form test" do
    it "Displays title message, username and password input fields and button to submit" do
      visit('/makersbnb/login')
      expect(page).to have_content "Login page"
      fill_in 'username', with: 'myusername'
      fill_in 'password', with: 'mypassword'
      click_button('Submit')
    end
  end
end
