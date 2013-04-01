class Object
  def self.const_missing(controller)
    return nil if @calling_const_missing
    @calling_const_missing = true
    require Whisky::Utils.underscore(controller.to_s)
    klass = Object.const_get(controller)
    @calling_const_missing = false

    klass
  end
end
