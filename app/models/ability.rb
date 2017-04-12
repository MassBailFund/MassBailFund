class Ability
  include CanCan::Ability

  def initialize(user)
    can [:new, :create], ClientReferral
  end
end
