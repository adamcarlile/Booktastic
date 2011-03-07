module Booktastic
  module SearchableModel
    
    def self.included(base)
      
      base.class_eval do
        
        #
        # Allow the search interface to be moved between models, to change the order of the returned relation ensure the model
        # responds to self.search_options and defines a hash containing options
        #
        
        def self.search(params)
          options = {:order => 'title ASC'}
          if respond_to?(:search_options)
            options.update(search_options)
          end
          t = self.arel_table
          conditions = nil
          t.columns.each do |column|
            condition = t[column.name.to_sym].matches("%#{params}%")
            conditions = conditions ? conditions.or(condition) : condition
          end
          self.unscoped.where(conditions).order(options[:order])
        end

      end
    
    end
    
  end
end