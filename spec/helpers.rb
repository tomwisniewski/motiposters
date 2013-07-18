module Helpers

	def stub_stripe				
		Stripe::Customer.stub(:create) { double('customer', :id => 123) }		
		Stripe::Charge.stub(:create) {}
	end

end