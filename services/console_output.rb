class ConsoleOutput
  attr_accessor :views, :unique_views

  def initialize(views:, unique_views:)
    @views = views
    @unique_views = unique_views
  end

  def output 
    print_views()
    print_unique_views()
  end

  def print_views
    puts "The list of webpages with most page views to less page views:"
    views.each do |view|
      puts "#{view.link} #{view.views} visits."
    end
  end

  def print_unique_views
    puts "The list of webpages with unique page views sorted by descending order:"
    unique_views.each do |view|
      puts "#{view.link} #{view.unique_views} unique views."
    end
  end

  def print(message)
    puts message
  end
end
