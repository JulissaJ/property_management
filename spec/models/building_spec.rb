require 'spec_helper'

describe Building do
  it { should have_valid(:address).when('933 Essex St.') }
  it { should_not have_valid(:address).when(nil,'')}

  it { should have_valid(:city).when('Lawrence') }
  it { should_not have_valid(:city).when(nil,'') }

  it { should have_valid(:state).when('MA') }
  it { should_not have_valid(:state).when(nil,'') }

  it {should have_valid(:postal).when('01843') }
  it {should_not have_valid(:postal).when(nil, '') }

  it 'belongs to owner' do
    owner = Owner.create(first_name:'Julissa', last_name:'Jansen', email:'julissa.jansen@gmail.com' )
    building = Building.create(address: '225 Centre Street', city:
      'Boston', state: 'MA', postal:'02125', owner: owner)

    expect(building.owner).to eql(owner)


  end



end
