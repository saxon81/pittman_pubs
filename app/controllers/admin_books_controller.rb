class AdminBooksController < ApplicationController
	before_action :authenticate_user!
end
