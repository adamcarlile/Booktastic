module Booktastic
  module SearchableModel
    
    def self.included(base)
      
      base.class_eval do
        
        def self.search(params)
          t = self.arel_table
          conditions = nil
          t.columns.each do |column|
            condition = t[column.name.to_sym].matches("%#{params}%")
            conditions = conditions ? conditions.or(condition) : condition
          end
          self.where(conditions)
        end
      
      end
    
    end
    
  end
end