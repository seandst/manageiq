module EmsRefresh::Refreshers
  class OpenstackRefresher < BaseRefresher
    include EmsRefresherMixin

    def parse_inventory(ems, _targets)
      EmsRefresh::Parsers::Openstack.ems_inv_to_hashes(ems, refresher_options)
    end

    def post_process_refresh_classes
      [Vm]
    end
  end
end
