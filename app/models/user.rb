class User < ActiveRecord::Base
  has_many :domain_admin_roles
  belongs_to :org_unit
end
