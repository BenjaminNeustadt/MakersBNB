feature 'add a space' do
  scenario 'it shows the label name field and description field' do
    visit '/makersbnb/add'
    expect(page).to have_content 'Add a Space'
    expect(page).to have_content 'Name'
    expect(page).to have_content 'Description'
    expect(page).to have_content 'Price'
  end

  scenario 'it adds a name, description and price of a space and shows confirmation' do
    visit '/makersbnb/add'
    fill_in 'Name', with: 'The Moon'
    fill_in 'Description', with: "It's pretty rocky!"
    fill_in 'Price', with: '500'
    click_on 'Submit'
    expect(page).to have_content 'Here are the confirmation details for your new space:'
    expect(page).to have_content 'Name: The Moon'
    expect(page).to have_content "Description: It's pretty rocky!"
    expect(page).to have_content "Price: £500.00"
  end

  scenario 'it adds a name, description and price of a different space and shows confirmation' do
    visit '/makersbnb/add'
    fill_in 'Name', with: 'Buckingham Palace'
    fill_in 'Description', with: "This place is very fancy"
    fill_in 'Price', with: '4000'
    click_on 'Submit'
    expect(page).to have_content 'Here are the confirmation details for your new space:'
    expect(page).to have_content 'Name: Buckingham Palace'
    expect(page).to have_content 'Description: This place is very fancy'
    expect(page).to have_content "Price: £4,000.00"
  end

  scenario 'it adds the name, description and price of two spaces and shows confirmation of each separately' do
    visit '/makersbnb/add'
    fill_in 'Name', with: 'Buckingham Palace'
    click_on 'Submit'
    click_on 'Add another space'
    fill_in 'Name', with: 'The Moon'
    fill_in 'Description', with: "It's pretty rocky!"
    fill_in 'Price', with: '400'
    click_on 'Submit'
    expect(page).to have_content 'Here are the confirmation details for your new space:'
    expect(page).not_to have_content 'Name: Buckingham Palace'
    expect(page).to have_content 'Name: The Moon'
    expect(page).to have_content "Description: It's pretty rocky!"
    expect(page).to have_content "Price: £400.00"
  end

  scenario 'it adds the space name, description and price to the spaces view page' do
    visit '/makersbnb/add'
    fill_in 'Name', with: 'The Moon'
    fill_in 'Description', with: "It's pretty rocky!"
    fill_in 'Price', with: '400'
    click_on 'Submit'
    click_on 'View all spaces'
    expect(page).to have_content 'Name: The Moon'
    expect(page).to have_content "Description: It's pretty rocky!"
    expect(page).to have_content "Price: £400.00"
  end

  scenario 'it adds multiple space names and descriptions and prices to the spaces view page' do
    visit '/makersbnb/add'
    fill_in 'Name', with: 'The Moon'
    fill_in 'Description', with: "It's pretty rocky!"
    fill_in 'Price', with: "400.50"
    click_on 'Submit'
    click_on 'Add another space'
    fill_in 'Name', with: 'Buckingham Palace'
    fill_in 'Description', with: "This place is very fancy"
    fill_in 'Price', with: "4000"
    click_on 'Submit'
    click_on 'View all spaces'
    expect(page).to have_content 'Name: The Moon'
    expect(page).to have_content "Description: It's pretty rocky!"
    expect(page).to have_content "Price: £400.50"
    expect(page).to have_content 'Name: Buckingham Palace'
    expect(page).to have_content "Description: This place is very fancy"
    expect(page).to have_content "Price: £4,000.00"
  end

  scenario 'you can reach the page from the homepage' do
    visit '/makersbnb/member'
    click_on 'Add Space'
    expect(page).to have_content 'Add a Space'
  end
end
