class Like < ActiveRecord::Base
    validates :user_id, {presence: true}
    validates :todo_id, {presence: true}
end
