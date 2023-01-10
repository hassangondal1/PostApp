class Post < ApplicationRecord
    has_many :comments
    belongs_to :user
    validates :title , presence: true
    validates :post_field , presence: true
    after_create_commit {broadcast_prepend_to "posts"}
    after_update_commit {broadcast_replace_to "posts"}
    after_destroy_commit {broadcast_remove_to "posts"}

end
