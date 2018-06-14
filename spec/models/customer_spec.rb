require 'rails_helper'

RSpec.describe Customer, type: :model do
	#fixtures :all
  it 'Create a Customer' do
  		customer = create(:customer, name: "Vitor")
 		expect(customer.name).to eq("Vitor")
  end

   it 'Create a Customer' do
  		customer = create(:customer, vip: false, days_to_pay: 10)
 		expect(customer.vip).to eq(false)
  end

  it 'Usando o attributes_for' do
  	attrs  = attributes_for(:customer)
  	attrs1 = attributes_for(:customer_vip)
  	attrs2 = attributes_for(:customer_default)
  	puts attrs
  	puts attrs1
  	puts attrs2
  end	

  it 'Atributo Transitorio' do
  	 customer = create(:customer_default, upcased: true)
  	 expect(customer.name.upcased).to eq(customer.name)
  end
  	
  it { expect{ create(:customer) }.to change {Customer.all.size}.by(1)}

end
