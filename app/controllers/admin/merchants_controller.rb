class Admin::MerchantsController < ApplicationController

    def index 
        @merchants = Merchant.all 
    end 

    def show 
        @merchant = Merchant.find(params[:id])
    end 

    def edit 
        @merchant = Merchant.find(params[:id])
    end 

    def update 
        merchant = Merchant.find(params[:id])
        if params[:status] != nil 
            merchant.update(status: params[:status])
            redirect_to "/admin/merchants"
        elsif merchant_params[:name] != nil && merchant.update(merchant_params)
            redirect_to "/admin/merchants/#{merchant.id}"
            flash[:alert] = "Your merchant has been updated."
        else 
            redirect_to "/admin/merchants/#{merchant.id}/edit"
            flash[:alert] = "Error: name can't be blank"
        end 
    end 

    def new 
    end 

    def create 
        merchant = Merchant.create(name: params[:name], created_at: Time.now, updated_at: Time.now)
        redirect_to "/admin/merchants"
    end 

    private 
    def merchant_params 
        params.require(:merchant).permit(:name)
    end
end 