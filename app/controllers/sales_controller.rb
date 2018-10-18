class SalesController < ApplicationController
	before_action :authenticate_user!
	before_action :load_book, except: [:index]

	def index
		@sales = Sale.where(user: current_user)
		@sales = current_user.sales
	end

	def new
		@sale = Sale.new
	end

	def create
		begin
			stripe_token = sale_params[:stripe_token]
      		stripe_charge = StripeServices::CreateCharge.call(@book, current_user, stripe_token)
      		Sale.create(book: @book, user: current_user, stripe_charge_id: stripe_charge.id)
      		redirect_to sales_path
      	rescue Stripe::InvalidRequestError, Stripe::CardError => error
			@sale = Sale.create(book:params[:book_id])
			@card_errors = error.message
			render :new
			redirect_to sales_path
		end
	end

	def show
		@sale = Sale.find.params[:id]
	end
end
