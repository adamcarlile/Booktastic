module Booktastic
  module ConditionalSet
    
    def set_if_value_does_not_exist(column, &block)
      if send(column).nil?
        begin
          write_attribute(column, block.call)
          save
          send(column)
        rescue 
          false
        end
      else
        send(column)
      end
    end
    
  end
end