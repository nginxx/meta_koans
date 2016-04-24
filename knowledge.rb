def attribute(a, &block)
      a, default = a.first if a.is_a?(Hash)
      prop = '@' + a

    define_method(a) {
      if instance_variable_defined?(prop)
        instance_variable_get(prop)
      else
        val = block_given? ? instance_eval(&block) : default
        instance_variable_set(prop, val)
      end
    }
    define_method("#{a}=") { |val| instance_variable_set prop, val }
    define_method("#{a}?") { instance_variable_get(prop) }
end