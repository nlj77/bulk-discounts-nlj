class BulkDiscountsController < ApplicationController
    def index 
        @merchant = Merchant.find(params[:merchant_id])
        @bulk_discounts = BulkDiscount.all
    end

    def new
        @merchant = Merchant.find(params[:merchant_id])
    end

    def create
        merchant = Merchant.find(params[:merchant_id])
        bulk_discount = merchant.bulk_discounts.new(name: params[:name], percentage: params[:percentage], threshold: params[:threshold], created_at: Time.now, updated_at: Time.now)
        if bulk_discount.save
            redirect_to "/merchants/#{merchant.id}/bulk_discounts"
        else
            redirect_to "/merchants/#{merchant.id}/bulk_discounts/new"
            flash[:alert] = "Error: Please fill out all required fields!"
        end
    end

    def destroy 
        @merchant = Merchant.find(params[:merchant_id])

        bulk_discount = BulkDiscount.find(params[:id])
        bulk_discount.destroy
        redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
    end

    def show 
        @bulk_discount = BulkDiscount.find(params[:id])
    end
end