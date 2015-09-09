describe Band do
  it { should have_and_belong_to_many(:releases) }
  it { should have_and_belong_to_many(:artists) }

  it { should have_valid(:name).when("The Mortimers") }
  it { should_not have_valid(:name).when(nil, "") }
end
