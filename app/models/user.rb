class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authors, foreign_key: :author_id
  has_many :books

  has_many :sales
  has_many :purchased_books, source: :book

  validates :name, :email, presence: true
end
