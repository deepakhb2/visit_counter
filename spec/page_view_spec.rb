require_relative '../lib/page_view'

describe PageView do 
  before(:each) do
    @link, @views, @unique_views = '/index', 10, 4 
    @page_view = PageView.new(
      link: @link,
      views: @views,
      unique_views: @unique_views
    )
  end

  it "Should create object for PageView class" do 
    expect(@page_view).to be_instance_of PageView 
  end 
    	
  it "should create object with correct instace values" do 
    expect(@page_view.link).to eql @link
    expect(@page_view.views).to eql @views
    expect(@page_view.unique_views).to eql @unique_views
  end 
end
