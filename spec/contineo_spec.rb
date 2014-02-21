require 'spec_helper'

describe 'Contineo multiple databases' do
  it "should return count for first database as zero" do
    Doctor.count.should be_zero
  end

  it "should return count for second database as zero" do
    Teacher.count.should be_zero
  end
end
