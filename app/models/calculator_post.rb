class CalculatorPost < Calculator
    preference :avia, :decimal, :default => 0
    preference :warning
    preference :max_weight, :decimal, :default => 20000
    preference :weight_limit, :decimal, :default => 10000
    preference :declared_value, :decimal, :default => 0
    preference :default_cost, :decimal, :default => 0
    preference :add_cost, :decimal, :default => 0

 def self.description
     I18n.t("calculator_post")
       end

 def self.register
     super
     Coupon.register_calculator(self)
     ShippingMethod.register_calculator(self)
     ShippingRate.register_calculator(self)
 end
 
 def distroy
 end

 def compute(object)
     total_weight = object.map{|o|
        (o.variant.weight || 0) * o.quantity
     }.sum

     if object.is_a?(Array)
        total_sum = object.map{ |o| o.respond_to?(:amount) ? o.amount : o.to_d }.sum
     else
        total_sum = object.respond_to?(:amount) ? object.amount : object.to_d
     end

     if (total_weight <= self.preferred_max_weight)
        decl_val = total_sum * preferred_declared_value / 100
        w500 = preferred_default_cost + preferred_avia + decl_val

        if (total_weight <= 500)
           res = w500
        else

           j = (total_weight - 500) / 500
           if ((j-j.to_i) == 0)
              i = j
           else
              i = j + 1
           end

           if (total_weight <= preferred_weight_limit )
              res = w500 + i*preferred_add_cost
           else
              res = (preferred_default_cost + i*preferred_add_cost)*1.3 + preferred_avia + decl_val
           end
        end
        return res
     else
     end
 end
end
