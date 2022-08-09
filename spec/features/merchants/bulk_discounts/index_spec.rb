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
        
        expect(page).to have_content("Discount A, 10%, Quantity Threshold: 10")
        expect(page).to have_content("Discount B, 25%, Quantity Threshold: 20")
        expect(page).to have_content("Discount C, 30%, Quantity Threshold: 40")
        expect(page).to_not have_content("Discount D, 25%, Quantity Threshold:15")
    end

    it "has a link to create a new discount" do 
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        discount_a = merchant_1.bulk_discounts.create!(name:"Discount A", percentage: 10, threshold: 10 )
        discount_b = merchant_1.bulk_discounts.create!(name:"Discount B", percentage: 25, threshold: 20 )
        discount_c = merchant_1.bulk_discounts.create!(name:"Discount C", percentage: 30, threshold: 40 )
        discount_d = merchant_1.bulk_discounts.create!(name:"Discount D", percentage: 25, threshold: 15 )
        visit "/merchants/#{merchant_1.id}/bulk_discounts"

        expect(page).to have_button("Create a new discount")

        click_on("Create a new discount")

        expect(current_path).to eq("/merchants/#{merchant_1.id}/bulk_discounts/new")
    end

    it "has can delete a discount" do
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        discount_a = merchant_1.bulk_discounts.create!(name:"Discount A", percentage: 10, threshold: 10 )
        discount_b = merchant_1.bulk_discounts.create!(name:"Discount B", percentage: 25, threshold: 20 )
        discount_c = merchant_1.bulk_discounts.create!(name:"Discount C", percentage: 30, threshold: 40 )
        discount_d = merchant_1.bulk_discounts.create!(name:"Discount D", percentage: 25, threshold: 15 )
        visit "/merchants/#{merchant_1.id}/bulk_discounts"

        expect(page).to have_button("Delete Discount A")

        click_on("Delete Discount A")

        expect(page).to_not have_content("Discount A")

    end

    it "can show upcoming holidays and the next three holidays" do
        
    end
end


# As a merchant
# When I visit the discounts index page
# I see a section with a header of "Upcoming Holidays"
# In this section the name and date of the next 3 upcoming US holidays are listed.

# Use the Next Public Holidays Endpoint in the [Nager.Date API](https://date.nager.at/swagger/index.html)