module RedmineTargetClientProject
  module MailHandlerPatch
    unloadable  

    def self.included(base)
      base.send(:include, InstanceMethods)
  
      base.class_eval do
        alias_method_chain :target_project, :tcp
      end
    end
  
    module InstanceMethods
      def target_project_with_tcp
        target = target_project_without_tcp          
        # Select first project assigned to the user
        unless user.projects.first.nil?
          target = user.projects.first
        end
        target
      end  
    end
  end
end

