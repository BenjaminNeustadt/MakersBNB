feature "Using the menu" do 
  context "from the spaces page" do
    scenario "Allows the user to navigate to the requests page" do
      visit('/makersbnb/spaces')
      click_link 'Requests'
      expect(page).to have_content 'My Requests'
    end 

    scenario "Allows the user to navigate to the home page" do
      visit('/makersbnb/spaces')
      click_link 'Home'
      expect(page).to have_content 'Welcome to MakersBNB'
    end 

    scenario "Allows the user to navigate to the add space page" do
      visit('/makersbnb/spaces')
      click_link 'Add Space'
      expect(page).to have_content 'Add a Space'
    end
  end

  context "from the requests page" do
    scenario "Allows the user to navigate to the home page" do
      visit('/makersbnb/requests')
      click_link 'Home'
      expect(page).to have_content 'Welcome to MakersBNB'
    end 

    scenario "Allows the user to navigate to the spaces page" do
      visit('/makersbnb/requests')
      click_link 'Spaces' 
      expect(page).to have_content 'Book a Space'
    end 

    scenario "Allows the user to navigate to the add space page" do
      visit('/makersbnb/requests')
      click_link 'Add Space'
      expect(page).to have_content 'Add a Space'
    end
  end
end
