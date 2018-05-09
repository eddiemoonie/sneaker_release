class SneakerRelease::Sneaker

  attr_accessor :name, :url, :price, :date, :color, :description, :style_code

  @@all = []

  def self.new_from_index_page(s)
    self.new(
      s.css("div.release-date-title").text.strip,
      s.css("a").attribute("href").text.strip,
      s.css("div.event-date.first-event").text.strip
    )
  end

  def initialize(name=nil, url=nil, date=nil, image=nil)
    @name = name
    @url = url
    @date = date
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

end
