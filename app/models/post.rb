class Post < ApplicationRecord
    has_many :comments
    belongs_to :user
    validates :title , presence: true
    validates :post_field , presence: true
    
end
