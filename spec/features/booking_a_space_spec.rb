feature "Booking a space" do 
  scenario "User can book a space and receives a confirmation" do 
    visit '/makersbnb/add'
    fill_in 'Name', with: 'Buckingham Palace'
    click_on 'Submit'
    visit('/makersbnb/spaces')
    # test clicking the first requests button and not all the requests buttons 
    click_button('requests', match: :first) 
    expect(page).to have_content "Your booking request is now confirmed"
  end 
  
  context "when a user has signed up" do
    scenario 'user can reach the booking page from the homepage' do
      visit '/makersbnb/member'
      click_on 'Spaces'
      expect(page).to have_content 'Book a Space'
    end
  end

  context "After a user has booked a space" do 
    scenario "User receives an automatic approval message" do 
      visit('/makersbnb/approved')
      click_button('Ok')
      expect(page).to have_content "Your booking has now been approved"
    end 
  end 
end 
