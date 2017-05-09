#
# All access control is defined by Ability
# The DSL is explained in the CanCanCan documentation:
# https://github.com/CanCanCommunity/cancancan/wiki
#
class Ability
  include CanCan::Ability

  def initialize(user)
    can [:new, :create], Client
  end
end
