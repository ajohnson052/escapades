class Ability
  include CanCan::Ability

  def initialize(user)
    can [:edit, :update, :destroy], Escapade, user_id: user.id
    can [:edit, :update, :destroy], Response, user_id: user.id
    can [:commit, :respond], User, User do |creator|
      user.friends.include?(creator) || user.inverse_friends.include?(creator)
    end
    can :create, Friendship, Friendship do |friendship|
      Tempship.find_by(temp_id: user.id, user_id: friendship.friend_id)
    end
    can :destroy, Tempship, Tempship do |tempship|
      user.id === tempship.user_id || user.id=== tempship.temp_id
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
