require "rails_helper"

RSpec.describe "Books", type: :system do
	
	it "has an index page of all books" do
		first_book = create(:book)
		second_book = create(:book)

		visit "/"

		expect(page).to hae_text(first_book.title)
		expect(page).to hae_text(second_book.title)
	end
end