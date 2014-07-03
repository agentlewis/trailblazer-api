class User < ActiveRecord::Base
  has_many :domain_admin_roles
  belongs_to :domain
  belongs_to :org_unit

  scope :admin,    -> { where(:admin    => true ) }
  scope :teacher,  -> { where(:teacher  => true ) }
  scope :student,  -> { where(:active   => true, :teacher => false, :admin => false) }
  scope :inactive, -> { where(:active   => false) }

  # Be wary: http://blog.spoolz.com/2014/05/20/rails-habtm-with-unique-scope-and-select-columns/
  has_and_belongs_to_many :classrooms, -> { uniq }

  def student?
    !admin? && !teacher? && active?
  end
end
