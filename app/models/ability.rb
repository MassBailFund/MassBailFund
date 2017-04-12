class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= nil

    can [:new, :create], ClientReferral
  end
end
