class SneakerRelease::CLI

  def call
    SneakerRelease::Scraper.new.make_sneakers
    puts ""
    puts "  Welcome to the Sneaker Release Calendar"
    start
  end

  def start
    print_sneakers_list

    puts ""
    puts "Which sneaker release would you like to see?"
    puts ""

    input = gets.strip.to_i
    if input.between?(1,12)
      sneaker = SneakerRelease::Sneaker.find(input)
      print_sneaker_info(sneaker)
    else
      puts ""
      puts "INVALID OPTION. Please select again from the following:"
      start
    end

    more_sneakers
  end

  def print_sneakers_list
    puts ""
    puts "-------- Upcoming Sneaker Releases --------"
    puts ""
    SneakerRelease::Sneaker.all.each.with_index(1) do |sneaker, index|
      puts "#{index}. #{sneaker.name} --- #{sneaker.date}"
    end
  end

  def print_sneaker_info(sneaker)
    puts ""
    puts "-------- #{sneaker.name} --------"
    puts ""
    puts "COLOR:                  #{sneaker.color}"
    puts "RELEASE DATE:           #{sneaker.date}"
    puts "STYLE CODE:             #{sneaker.style_code}"
    puts "RETAIL PRICE:           #{sneaker.price}"
    puts "LINK(pics available):   #{sneaker.url}"
    puts ""
    puts "-------- Description --------"
    puts ""
    puts "#{sneaker.description}"
    puts ""
  end

  def more_sneakers
    puts ""
    puts "Would you like to see another sneaker release? (Enter Y or N)"
    puts ""

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank You and Good Luck!"
      exit
    else
      puts ""
      puts "Sorry, I couldn't understand."
      more_sneakers
    end
  end

end
