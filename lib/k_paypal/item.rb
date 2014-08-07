module KPaypal
  class Item
    include Extensions::MassAssignment

    attr_accessor :name
    attr_accessor :description
    attr_accessor :quantity
    attr_accessor :amount
    attr_accessor :number
    attr_accessor :category
    attr_accessor :url

    private
    def before_initialize
      self.quantity = 1
    end
  end
end