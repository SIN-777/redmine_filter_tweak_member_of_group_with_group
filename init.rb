require 'redmine'

Redmine::Plugin.register :redmine_filter_tweak_member_of_group_with_group do
  name 'Redmine Filter Tweak Member Of Group With Group plugin'
  author 'Shingo Sekiguchi'
  description 'This plugin will add the issues assigned to the group itself into the issues list filtered by "member_of_group".'
  version '0.0.1'
  url 'https://github.com/SIN-777/redmine_filter_tweak_member_of_group_with_group'
  author_url ''
end

require File.dirname(__FILE__) + '/lib/filter_tweak_member_of_group_with_group_patch.rb'
Query.send(:include, FilterTweakMemberOfGroupWithGroupPatch)
