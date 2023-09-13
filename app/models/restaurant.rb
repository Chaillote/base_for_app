class Restaurant < ApplicationRecord


  has_many :reviews, dependent: :destroy

  belongs_to :restaurant

  validates :content, presence: true

  has_many :trips
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
