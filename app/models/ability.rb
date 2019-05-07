# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    # Abilities for all users, even if not logged_in
    can :create, Profile
    can :read, Profile, tutor?: true
    can :read, Review

    # Guest user if not logged_in
    user ||= User.new 

    # Abilities for logged in users
    if user.present?
      can :create, [Review, Booking] 
      # can [:update, :edit], Review, reviewer_id: user.id
      can [:update, :destroy], Review do |review|
        review.reviewer_id == user.id
      end

      can [:update, :edit], [Profile] do |profile|
        profile.user_id == user.id
      end

      can [:update, :edit], [Profile, Booking], user_id: user.id
      can :delete, [Booking, Review], user_id: user.id
        # Abilities for Moderator user
        if user.moderator?
          can :manage, Review
          can [:edit, :update], Booking
          # Abilities for Admin user
          if user.admin?
            can :manage, :all
          end
        end
    end
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
