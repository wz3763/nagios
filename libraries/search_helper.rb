require 'chef/log'
require 'chef/search/query'

# simplified access to nodes and roles for building Nagios hostgroups and hosts
class NagiosSearch
  attr_accessor :hostgroups
  attr_accessor :hosts

  def initialize(node)
    @node = node

    @hostgroups = []
    @hosts = []

    # search all environments or just the local environment
    if node['nagios']['multi_environment_monitoring']
      # build environment specific search string to allow for only monitoring certain environments
      env_search_string = node['nagios']['monitored_environments'].empty? ? '' : ' AND (chef_environment:' + node['nagios']['monitored_environments'].join(' OR chef_environment:') + ')'
      @nodes = Chef::Search::Query.new.search(:node, "name:*#{env_search_string}")
    else
      @nodes = Chef::Search::Query.new.search(:node, "name:* AND chef_environment:#{@node.chef_environment}")
    end

    @roles = Chef::Search::Query.new.search(user_databag, "groups:#{group} NOT action:remove")
  end

  def build_hosts_list
    @hosts = @nodes

    # workaround the nagios server being the first node in the environment and this being the nodes first run
    if @hosts.empty?
      Chef::Log.info('No nodes returned from search, using this node so hosts.cfg has data')
      @hosts << @node
    end

    # Sort by name to provide stable ordering
    @hosts.sort! { |a, b| a.name <=> b.name }
  end

  def build_hostgroups_list
    # add all roles to the nagios hostgroup
    @roles.each do |r|
      @hostgroups << r.name
    end

    # If using multi environment monitoring add all environments to the array of hostgroups
    if node['nagios']['multi_environment_monitoring']
      # if monitored environments are specified add those to the array, otherwise search and add all environments
      if node['nagios']['monitored_environments']
        @hostgroups << node['nagios']['monitored_environments']
      else
        search(:environment, '*:*') do |e|
          @hostgroups << e.name
        end
      end
    end

    # Add all unique platforms to the array of hostgroups
    @nodes.each do |n|
      @hostgroups << n['os'] unless @hostgroups.include?(n['os']) || n['os'].nil?
    end

    # Hack to deal with the nagios server being the first linux system
    @hostgroups << node['os'] unless @hostgroups.include?(node['os']) || @node['os'].nil?

    # Return a sorted and unique hostgroups array
    @hostgroups.unique!.sort!
  end
end
