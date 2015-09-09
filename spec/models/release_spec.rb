describe Release do
  it { should have_and_belong_to_many(:bands) }
  it { should have_and_belong_to_many(:artists) }

  it { should have_valid(:title).when("Does Dallas") }
  it { should_not have_valid(:title).when(nil, "") }

  it { should have_valid(:track_list).when("1. Song 1\n2. Song 2") }
  it { should_not have_valid(:track_list).when(nil, "") }

  it { should have_valid(:record_label).when("Best Records") }
  it { should_not have_valid(:record_label).when(nil, "") }
end
