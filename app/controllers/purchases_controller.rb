class PurchasesController < ApplicationController

    def create
        purchase = Purchase.create(purchase_params)
        message = purchase.purchase_book 
        redirect_to user_path(purchase.user), flash: { message: message }
    end
    
    private
    
    def purchase_params
        params.require(:purchase).permit(
        :user_id,
        :book_id
        )
    end

end
