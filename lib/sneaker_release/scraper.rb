class SneakerRelease::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.kicksonfire.com/app/"))
  end

  def scrape_sneakers_index
    self.get_page.css("div.sneaker-section.row div.release-date-image-wrapper")
  end

  def make_sneakers
    scrape_sneakers_index.each do |s|
      SneakerRelease::Sneaker.new_from_index_page(s)
    end
  end

end
