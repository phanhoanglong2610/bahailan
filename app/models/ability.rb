class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    p user
    if user
      user_rules(user)
    else
      default_rules
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
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end

  def user_rules(user)
    user.roles.each do |role|
      exec_role_rules(role.name) if user.is? (role.name)
    end
    default_rules
  end

  def exec_role_rules role
    meth = :"#{role}_rules"
    send(meth) if respond_to? meth
  end

  # various rules methods for each role
  def admin_rules
    can :manage, :all
  end

  def moderator_rules
    can :manage, visible_models
  end

  def editor_rules
    can :read, visible_models
    can :create, visible_models
    can :update, visible_models
    cannot :destroy, visible_models
  end

  def guest_rules
    default_rules
  end

  def default_rules
    can :read, :all
  end

  def visible_models
    [Contact, BookTour, Product]
  end

end
