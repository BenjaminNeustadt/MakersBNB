require 'space'

RSpec.describe Space do
  context ".all" do
    it "Returns all spaces" do
      Space.add("Happy House", "A really cosy space, where you can relax", "200")
      Space.add("Buckingham Palace", "The biggest house in the world", "4000")
      expect(Space.all).to eq [["Happy House", "A really cosy space, where you can relax", "£200.00"], ["Buckingham Palace", "The biggest house in the world", "£4,000.00"]]
    end
    # this test needs to be modified to reflect the all method [DONE]
    # add method needs to be able to add a price [PENDING]
    # once the add method is complete, we can use the add method to give Space.all its eq value

    it 'adds a space with a name, description and price' do
      Space.add('The Moon', 'The Rockiest Place you could imagine...', '50.50')
      expect(Space.show_most_recent_space).to eq ['The Moon', 'The Rockiest Place you could imagine...', '£50.50']
    end

    it 'adds a different space with a different name and description' do
      Space.add('The Sea', "It's very wet!", '400.60')
      expect(Space.show_most_recent_space).to eq ['The Sea', "It's very wet!", "£400.60"]
    end

    it 'returns the multiple names and descriptions when they have been added' do
      Space.add('The Sea', "It's very wet!", '400.60')
      Space.add('The Moon', 'The Rockiest Place you could imagine...', '50.50')
      expect(Space.show_most_recent_space).to eq ['The Moon', 'The Rockiest Place you could imagine...', '£50.50']
      expect(Space.all).to eq [['The Sea', "It's very wet!", "£400.60"], ['The Moon', 'The Rockiest Place you could imagine...', '£50.50']]
    end
  end
end
