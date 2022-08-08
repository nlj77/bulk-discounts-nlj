require 'rails_helper'

RSpec.describe "Bulk Discounts Show Page" do
    it "shows a bulk discount's quantity and percentage discount" do
        merchant_1 = Merchant.create!(name: "Joe Schmoe", created_at: Time.now, updated_at: Time.now)
        merchant_2 = Merchant.create!(name: "John Lennon", created_at: Time.now, updated_at: Time.now)

        discount_a = merchant_1.bulk_discounts.create!(name:"Discount A", percentage: 10, threshold: 10 )
        discount_b = merchant_1.bulk_discounts.create!(name:"Discount B", percentage: 25, threshold: 20 )
        discount_c = merchant_1.bulk_discounts.create!(name:"Discount C", percentage: 30, threshold: 40 )
        discount_d = merchant_1.bulk_discounts.create!(name:"Discount D", percentage: 25, threshold: 15 )

        visit "/merchants/#{merchant_1.id}/bulk_discounts/#{discount_a.id}"

        expect(page).to have_content("10% Discount")
        expect(page).to have_content("10 Item Threshold")
    end
end

# Merchant Bulk Discount Show

# As a merchant
# When I visit my bulk discount show page
# Then I see the bulk discount's quantity threshold and percentage discount

# Merchant Bulk Discount Edit

# As a merchant
# When I visit my bulk discount show page
# Then I see a link to edit the bulk discount
# When I click this link
# Then I am taken to a new page with a form to edit the discount
# And I see that the discounts current attributes are pre-poluated in the form
# When I change any/all of the information and click submit
# Then I am redirected to the bulk discount's show page
# And I see that the discount's attributes have been updated