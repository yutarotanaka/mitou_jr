class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :keijibans
    has_many :todos
    attr_accessor :remember_token
    self.inheritance_column = :_type_disabled
    
    def todos
        return Todo.where(user_id: self.id)
    end
    
    #def todos_date
        #return Todo.where(deadline: )

    def todos_universal
        return Todo.where(universal: true)
    end
    
    def User.new_token
    SecureRandom.urlsafe_base64
    end
  
    def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
   
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
      
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
