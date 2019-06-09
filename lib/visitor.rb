class Visitor
  attr_accessor :link, :ip

  def initialize(link:, ip:)
    @link, @ip = link, ip
  end
end
