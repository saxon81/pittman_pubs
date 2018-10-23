ActiveRecord::Base.transaction do
  User.create!(name: "Adam", email: "adam@adam.com", password: "testing1")

  books = [
    { title: "What", price: 10.99 },
    { title: "One Arm", price: 4.99 },
    { title: "Yarn Tegridy", price: 24.99 },
    { title: "The Wooden Desk", price: 2.99 }
  ]
 
  books.each do |book_attrs|
    book = Book.new(book_attrs)
    book.author = Author.all.sample
    book.book_cover.attach(io: File.open(Rails.root.join('public/doge.png')), filename:"doge.png")
    book.save!
  end

  authors = [
    {name: "Bobby Dews"},
    {name: "Julio Franco"},
    {name: "Juan Valdez"},
    {name: "Fancy Nancy"},
    {name: "Kenny Powers"},
  ]

  authors.each do |author|
    Author.create!(name: author[:name])
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
