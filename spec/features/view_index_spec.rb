feature "Viewing the homepage" do
  scenario "Returns a known message showing connection established" do
    visit('/makersbnb')
<<<<<<< HEAD
    expect(page).to have_content('Welcome to MakersBNB')
    expect(page).to have_content('The place to rent properties')
=======
    expect(page).to have_content('Welcome to MakersBNB') 
    expect(page).to have_content('The ONLY place to rent properties')
>>>>>>> 4_signup_feature_2
  end
end


# expect(page).to have_content("Spaces Requests\nWelcome to MakersBNB\nThe ONLY place to rent properties") 
#     expect(page).to have_content("Spaces Requests\nWelcome to MakersBNB\nThe ONLY place to rent properties") 