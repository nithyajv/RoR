require 'rails_helper'

RSpec.describe Tasklist, type: :model do
  subject { Tasklist.new(Taskname: "Ruby",Status: "Completed", Duedate: nil, Details: nil, user_id: 10)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a Taskname" do
    subject.Taskname=nil
    expect(subject).to_not be_valid
  end


  # describe 'validations' do
  #   describe 'it validates Taskname' do
  #     it { is_expected.to validate_presence_of(:Taskname) }
  #   end
  # end

end