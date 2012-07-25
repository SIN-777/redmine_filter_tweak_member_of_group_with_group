require 'redmine'

Redmine::Plugin.register :redmine_filter_tweak_member_of_group_with_group do
  name 'Redmine Filter Tweak Member Of Group With Group plugin'
  author 'Shingo Sekiguchi'
  description 'This plugin tweaks filter funcion.'
  version '0.0.1'
  url ''
  author_url ''
end

require File.dirname(__FILE__) + '/lib/filter_tweak_member_of_group_with_group_patch.rb'
Query.send(:include, FilterTweakMemberOfGroupWithGroupPatch)
