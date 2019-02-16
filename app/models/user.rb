#
# Stores information about a person who has an occount to log in
#
class User < ApplicationRecord
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable,
         :lockable, :timeoutable
end
