describe Artist do
  it { should have_and_belong_to_many(:bands) }
  it { should have_and_belong_to_many(:releases) }

  it { should have_valid(:first_name).when("Roald") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Dahl") }
  it { should_not have_valid(:last_name).when(nil, "") }
end
