class PageView
  attr_accessor :link, :views, :unique_views

  def initialize(link:, views:, unique_views:)
    @link, @views, @unique_views =
      link, views, unique_views
  end
end
