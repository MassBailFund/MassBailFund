class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= nil
  end
end
