class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, uniqueness: { scope: :user_id }    
    validates :contents, presence: true, uniqueness: { scope: :user_id }    
end
