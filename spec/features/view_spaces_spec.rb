feature "Viewing a list of all spaces" do
  xscenario "Displays individual descriptive values for a space" do
    visit('/makersbnb/spaces')
    expect(page).to have_content "Name: Happy House, Description: A really cosy space, where you can relax, Price: $24.00"
  end

  xscenario "Displays multiple spaces" do
    visit('/makersbnb/spaces')
    expect(page).to have_content "Name: Buckingham Palace, Description: The biggest house in the world, Price: $100.00"
    expect(page).to have_content "Name: Happy House, Description: A really cosy space, where you can relax, Price: $24.00"
  end
end
