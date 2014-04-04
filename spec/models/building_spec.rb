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



end


# it { should have_valid(:title).when('Hacking the USA') }
#   it { should_not have_valid(:title).when(nil, '') }

#   it { should have_valid(:content).when('Here\'s how to hack America') }
#   it { should_not have_valid(:content).when(nil, '') }
