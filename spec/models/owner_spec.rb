require 'spec_helper'

describe Owner do
  it { should have_valid(:first_name).when('Julissa') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Jansen') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:email).when('julissa.jansen@gmail.com') }
  it { should_not have_valid(:email).when(nil, '') }
end


