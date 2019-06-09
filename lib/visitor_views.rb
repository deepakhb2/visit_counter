require_relative './page_view'

class VisitorViews
  attr_accessor :visitors, :page_views

  def initialize(visitors:)
    @visitors = visitors
    @page_views = page_views()
  end

  def page_views()
    unique_links.collect do |link|
      PageView.new(
        link: link,
        views: views(link),
        unique_views: unique_views(link)
      )
    end
  end

  def desc_sort_by(attr)
    sort_by(attr).reverse
  end

  def sort_by(attr)
    page_views.sort_by(&attr.to_sym)
  end

  def views(link) 
    visitors.count{|visitor| visitor.link == link}
  end

  def unique_views(link)
    unique_visitors.count{|visitor| visitor.link == link}
  end

  def unique_visitors
    visitors.uniq{|visitor| visitor.link+":"+visitor.ip}
  end

  def unique_links
    links.uniq
  end

  def links
    visitors.collect(&:link)
  end
end
