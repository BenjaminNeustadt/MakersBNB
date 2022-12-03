feature "Signing up to MakersBnB" do 
  scenario "Displays user's name on the homepage after they have signed up" do
    visit ('/makersbnb/signup') 
    fill_in('name', with: 'Test User')
    fill_in('username', with: 'Test.user123') 
    fill_in('email', with: 'test@makersbnb.com') 
    fill_in('password', with: 'Testpass123')
    click_button('Sign Up')
    expect(page).to have_content "Welcome Test User"
  end 
end 
