class Restaurant < ApplicationRecord


  has_many :reviews, dependent: :destroy

  belongs_to :restaurant

  validates :content, presence: true

  has_many :trips
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable




def cannot_reserve_own_cat
  if user_id == cat.user_id
    errors.add(:user_id, "cannot reserve their own cat")
  end

  
end
