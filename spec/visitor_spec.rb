require_relative '../lib/visitor' 

describe Visitor do 
  context "With valid input" do 
    before(:all) do
      @link, @ip = '/index', '192.168.1.1'
      @visitor = Visitor.new(link: @link, ip: @ip) 
    end
    it "Should create object for Visitor class" do
      expect(@visitor).to be_instance_of Visitor 
    end 
      	
    it "should create object with correct instace values" do 
      expect(@visitor.link).to eql @link
      expect(@visitor.ip).to eql @ip 
    end 
  end 
end
