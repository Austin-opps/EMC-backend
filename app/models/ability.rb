class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new # guest user (not logged in)
  
      if user.admin?
        can :manage, Product
      else
        can :read, Product
      end
    end
end