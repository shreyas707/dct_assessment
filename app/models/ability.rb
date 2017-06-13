class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "admin"
        can :manage, :all
    elsif user.role == "student"
        can :create, [Answer, KnowledgeBase]
        can :read, [Answer, Batch, BatchSet, KnowledgeBase]
        can :update, [BatchSet]
    end
  end

end
