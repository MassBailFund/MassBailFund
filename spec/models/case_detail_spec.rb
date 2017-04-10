describe CaseDetail do
  subject { FactoryGirl.create(:case_detail) }

  it { is_expected.to be_valid }
end
