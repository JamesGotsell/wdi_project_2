class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new 
    if user.role == "admin"
      can :manage, :all 
      can :destroy, Review
      can :create, Facility
      can :destroy, Facility
    elsif user.role == "user"
      can :read, :all 
      can :create, Review, user_id: user.id
      can :create, Coffeeshop, user_id: user.id 
      can :create, Review do |review|
        review.coffeeshop.user != user.id
        end 
    else user.role == nil
        can :read, :all
    end 
  end
end



