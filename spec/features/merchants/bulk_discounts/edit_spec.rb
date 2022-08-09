require 'rails_helper'

RSpec.describe "Bulk Discounts Show Page Edit function" do
    it "can edit a bulk discount's quantity and percentage discount" do

        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        discount_a = merchant_1.bulk_discounts.create!(name:"Discount A", percentage: 10, threshold: 10 )
        discount_b = merchant_1.bulk_discounts.create!(name:"Discount B", percentage: 25, threshold: 20 )
        discount_c = merchant_1.bulk_discounts.create!(name:"Discount C", percentage: 30, threshold: 40 )
        discount_d = merchant_1.bulk_discounts.create!(name:"Discount D", percentage: 25, threshold: 15 )

        visit "/merchants/#{merchant_1.id}/bulk_discounts/#{discount_a.id}"

        expect(page).to have_content("10% Discount")
        expect(page).to have_content("10 Item Threshold")
        expect(page).to have_button("Edit Discount A")
        click_on("Edit Discount A")

        expect(current_path).to eq("/merchants/#{merchant_1.id}/bulk_discounts/#{discount_a.id}/edit")
        save_and_open_page
        fill_in "name",	with: "Loyal Customer Discount" 
        fill_in "percentage", with: 15
        fill_in "threshold", with: 12
        click_on("Save")
        expect(page).to have_content("Loyal Customer Discount")
        expect(page).to have_content("15% Discount")
        expect(page).to have_content("12 Item Threshold")
        

    end
end