require 'rails_helper'

RSpec.describe 'food search' do 
    it 'can return a list of 20 foods with their attributes' do 
        visit '/'
        fill_in "q",	with: "cheese"
        click_button "Search"
        expect(current_path).to eq "/foods"
        expect(page).to have_content("Total search results:")
        expect(page).to have_content("Description:")
        expect(page).to have_content("CHEESE")
        expect(page).to have_content("Brand")
    end
    it 'edge case for no input' do 
        visit '/'
        fill_in "q",	with: ""
        click_button "Search"
        save_and_open_page
        expect(current_path).to eq "/"
        expect(page).to have_content("Invalid input")
      
    end
end