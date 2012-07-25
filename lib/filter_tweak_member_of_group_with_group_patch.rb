module FilterTweakMemberOfGroupWithGroupPatch
  def self.included(klass)
    klass.send(:include, InstanceMethods)
    klass.class_eval do
      alias_method_chain :sql_for_member_of_group_field, :group
    end
  end

  module InstanceMethods
    def sql_for_member_of_group_field_with_group(field, operator, value)
      sql = sql_for_member_of_group_field_without_group(field, operator, value)
      if operator == '*' || operator == '!*'
        sql
      else
        sql.gsub(/(assigned_to_id\s+?(?:NOT\s+?)?IN\s+?\()/){ $1 + value.map{|v| %Q|'#{v}',|}.join}
      end
    end
  end
end

