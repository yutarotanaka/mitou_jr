class User < ActiveRecord::Base
    has_many :keijibans
    has_many :todos
    
    def todos
        return Todo.where(user_id: self.id)
    end
    
    #def todos_date
        #return Todo.where(deadline: )

    def todos_universal
        return Todo.where(universal: true)
    end
end
