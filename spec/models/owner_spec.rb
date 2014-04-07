require 'spec_helper'

describe Owner do
  it { should have_valid(:first_name).when('Julissa') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Jansen') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('julissa.jansen@gmail.com') }
  it { should_not have_valid(:email).when(nil, '') }

  it 'has many buildings' do
    owner = Owner.create(first_name:'Julissa', last_name: 'Jansen', email:'julissa.jansen@gmail.com' )
    building_one = Building.create(address: '933 Essex Street', city:
      'Lawrence', state: 'MA', postal:'01841', owner: owner)
    building_two = Building.create(address: '9 Lenox Circle', city:
      'Lawrence', state: 'MA', postal:'01843', owner: owner)

    expect(owner.buildings.count).to eq(2)

  end

  context '#full_name' do
    it 'returns and owners full name' do
      owner = Owner.create(first_name:'Julissa', last_name: 'Jansen', email:'julissa.jansen@gmail.com' )
      expect(owner.full_name).to eql('Julissa Jansen')
    end
  end




end



