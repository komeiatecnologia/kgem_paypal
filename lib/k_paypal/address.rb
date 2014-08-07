module KPaypal
	class Address
		include Extensions::MassAssignment
    
    attr_accessor :street
    attr_accessor :city
    attr_accessor :state
    attr_accessor :postal_code
    attr_accessor :country
	end
end