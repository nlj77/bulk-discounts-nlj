require 'rails_helper'

RSpec.describe "Bulk Discounts Index Page" do
    it "has a link to the merchant's discounts" do
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        visit "/merchants/#{merchant_1.id}/dashboard"

        click_on "My Discounts"

        expect(current_path).to eq("/merchants/#{merchant_1.id}/bulk_discounts")
    end
    
    it "shows all the merchant's bulk discounts including their % discount and quantity thresholds" do
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        discount_a = merchant_1.bulk_discounts.create!(name:"Discount A", percentage: 10, threshold: 10 )
        discount_b = merchant_1.bulk_discounts.create!(name:"Discount B", percentage: 25, threshold: 20 )
        discount_c = merchant_1.bulk_discounts.create!(name:"Discount C", percentage: 30, threshold: 40 )
        discount_d = merchant_1.bulk_discounts.create!(name:"Discount D", percentage: 25, threshold: 15 )
        visit "/merchants/#{merchant_1.id}/bulk_discounts"
        save_and_open_page
        expect(page).to have_content("Discount A, 10%, Quantity Threshold: 10")
        expect(page).to have_content("Discount B, 25%, Quantity Threshold: 20")
        expect(page).to have_content("Discount C, 30%, Quantity Threshold: 40")
        expect(page).to_not have_content("Discount D, 25%, Quantity Threshold:15")
    end
end

# Merchant Bulk Discounts Index

# As a merchant
# When I visit my merchant dashboard
# Then I see a link to view all my discounts
# When I click this link
# Then I am taken to my bulk discounts index page
# Where I see all of my bulk discounts including their
# percentage discount and quantity thresholds
# And each bulk discount listed includes a link to its show page