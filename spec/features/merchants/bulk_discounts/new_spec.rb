require 'rails_helper'

RSpec.describe "Bulk Discounts New Discount Page" do
    it 'creates a new bulk discount item' do 
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        visit "/merchants/#{merchant_1.id}/bulk_discounts"
        click_on("Create a new discount")

        fill_in "name", with: "Loyal Customer Discount"
        fill_in "percentage", with: 15
        click_button 'Create'
        expect(page).to have_content("Error: Please fill out all required fields!")

        fill_in "name", with: "Loyal Customer Discount"
        fill_in "percentage", with: 15
        fill_in "threshold", with: 10
        click_button 'Create'
        expect(current_path).to eq("/merchants/#{merchant_1.id}/bulk_discounts")
        expect(page).to have_content("Loyal Customer Discount")



    end

end