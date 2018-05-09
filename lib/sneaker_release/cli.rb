class SneakerRelease::CLI

  def call
    SneakerRelease::Scraper.new.make_sneakers
    puts ""
    puts "  Welcome to the Sneaker Release Calendar"
    start
  end

  def start
    #print_sneakers_list

    puts ""
    puts "Which sneaker release would you like to see?"
    puts ""

    input = gets.strip.to_i
    if input.between?(1,12)
      sneaker = SneakerRelease::Sneaker.find(input)
      #print_sneaker_info(sneaker)
    else
      puts ""
      puts "INVALID OPTION. Please select again from the following:"
      start
    end

    #more_sneakers
  end

end
