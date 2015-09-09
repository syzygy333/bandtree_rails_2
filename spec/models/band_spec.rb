describe Band do
  it { should have_valid(:name).when("The Mortimers") }
  it { should_not have_valid(:name).when(nil, "") }
end
