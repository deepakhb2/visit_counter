require_relative '../lib/visitor_views'
require_relative '../lib/visitor'
require_relative '../lib/page_view'

describe VisitorViews do 
  before(:each) do
    @visits = [
      ['/index', '1.2.3.4'],
      ['/help', '1.2.3.4'],
      ['/contact-us', '1.2.3.4'],
      ['/index', '1.2.3.4'],
      ['/index', '1.2.3.4'],
      ['/help', '1.3.2.4']
    ]
    @visitors = @visits.collect do |visit|
      double(link: visit[0], ip: visit[1])
    end
    @visitor_views = VisitorViews.new(
      visitors: @visitors
    )
  end

  it "the 'page_views' method should return page view objects" do
    @visitor_views.page_views().each do |page_view|
      expect(page_view).to be_instance_of PageView 
    end
  end

  it "the 'page_views' method should return page view objects with correct instances" do
    links = ['/index', '/help', '/contact-us']
    views = [3, 2, 1]
    unique_views = [1, 2, 1]
    expect(@visitor_views.page_views().collect(&:link)).to eql links 
    expect(@visitor_views.page_views().collect(&:views)).to eql views 
    expect(@visitor_views.page_views().collect(&:unique_views)).to eql unique_views 
  end

  it "Should create object for VisitorViews class" do
    expect(@visitor_views).to be_instance_of VisitorViews 
  end 
  
  it "should create object with correct instace values" do
    expect(@visitor_views.visitors).to eql @visitors 
  end
  
  it "the 'links' method should return all the links" do
    expect(@visitor_views.links).to eql @visits.collect(&:first) 
  end

  it "the 'unique_links' method should return unique links" do
    expect(@visitor_views.unique_links).to eql @visits.collect(&:first).uniq 
  end

  it "the 'unique_vistors' method should return unique visitors" do
    expect(@visitor_views.unique_visitors.size).to eql 4 
  end

  it "the 'unique_views' method should return unique views count" do
    expect(@visitor_views.unique_views('/index')).to eql 1 
  end

  it "the 'views' method should return total views of a link" do
    expect(@visitor_views.views('/index')).to eql 3 
  end

  it "the 'sort_by' method should return page views sorted by 'views'" do
    links = ['/contact-us', '/help', '/index']
    expect(@visitor_views.sort_by('views').collect(&:link)).to eql links 
  end

  it "the 'sort_by' method should return page views sorted by 'unique_views'" do
    links = ['/index', '/contact-us', '/help']
    expect(@visitor_views.sort_by('unique_views').collect(&:link)).to eql links 
  end

  it "the 'desc_sort_by' method should return page views sorted by 'views'" do
    links = ['/index', '/help', '/contact-us']
    expect(@visitor_views.desc_sort_by('views').collect(&:link)).to eql links 
  end

  it "the 'desc_sort_by' method should return page views sorted by 'unique_views'" do
    links = ['/help', '/contact-us', '/index']
    expect(@visitor_views.desc_sort_by('unique_views').collect(&:link)).to eql links 
  end
end
