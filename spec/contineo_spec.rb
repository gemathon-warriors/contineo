require 'spec_helper'

describe 'Contineo multiple databases' do
  context "test connection and run basic AREL query" do
    it "should return count for first database as zero" do
      Doctor.count.should be_zero
    end

    it "should return count for second database as zero" do
      Teacher.count.should be_zero
    end
  end

  context '.env' do
    it 'should return environment name from configuration name' do
      Contineo.env('other_db_qa').should == 'qa'
    end
  end

  context '.db' do
    it 'should return db class from configuration name' do
      Contineo.db('other_db_qa').should == 'OtherDb'
    end
  end

  context '.other_than_application_db?' do
    it 'should return true when db in question is other than application db' do
      Contineo.other_than_application_db?('other_db_qa').should be_true
    end

    it 'should return false when db in question is application db' do
      Contineo.other_than_application_db?('qa').should be_false
    end
  end

  context '.define_db_connection_class' do
    it 'should define connection class for First DB with contineo method' do
      Contineo.define_db_connection_class('other_db_qa').should == OtherDb
      OtherDb.respond_to?('contineo').should be_true
    end
  end
end
