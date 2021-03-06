class ConfiguredSystem < ActiveRecord::Base
  include NewWithTypeStiMixin
  include ReportableMixin

  acts_as_miq_taggable
  belongs_to :configuration_manager
  belongs_to :configuration_profile
  has_one    :computer_system, :as => :managed_entity, :dependent => :destroy

  delegate :name,                      :to => :provider,                :prefix => true, :allow_nil => true
  delegate :my_zone, :provider, :zone, :to => :manager

  alias_method :manager, :configuration_manager

  def name
    hostname
  end
end
