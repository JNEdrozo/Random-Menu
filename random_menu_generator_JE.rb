#USER INTRO PROMPT------------------------------------
introduction <<YES
"Welcome to the Regional Randomized Menu Generator! To begin, enter:
\n(A) If you would like to generate a menu from our default menu items or,
\n(B) If you would like to enter your own menu item details."
YES

#OPTION A - DEFAULT MENU GENERATOR METHOD---------(BASELINE GENERATOR)---------
def default_menu_generator

  #USER ENTRY VALIDATION METHOD (~!But doesn't account for floats)
  def is_numeric?(obj)
     obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) ==
     nil ? false : true
  end

  #PROMPTS USER FOR PREFERRED TOTAL ITEMS ON MENU (user_total)
  puts "You've selected our Default Menu Generator!"
  puts "\nTo proceed, provide the total number of items you would like the generated menu to feature."
  puts "NOTE: The number must be a positive integer. \n\nMenu Item Total?" #~!what's best way of writing the put statements?

  user_total = gets.chomp

  while !(is_numeric?(user_total))
    puts "Remember, positive integers only! "
    user_total = gets.chomp
  end

  menu_total = user_total.to_i

  #DEFAULT ARRAYS FOR MENU ITEM COMBINATIONS
  food_region = ["Indian", "Italian", "Mediterranean", "Mexican", "Morroccan", "Nepalese", "Seattle", "Szechuan", "Thai", "Umbrian"]
  star_ingredient = ["Beef", "Chicken and Apple", "Eggplant", "Fennel Sausage", "Glazed Wild Salmon", "Grilled Tilapia", "Heirloom Tomato", "Pork", "Raspberry", "Shrimp"]
  food_type = ["Curry", "Enchiladas", "Lasagna", "Pasta", "Pilaf", "Pizza", "Salad", "Sandwich", "Soup", "Stew"]

  #LOOP PULLS 1 RANDOM ELEMENT FROM EACH DEFAULT ARRAY TO CREATE A MENU ITEM AND PUSHES IT INTO THE MENU ARRAY
  menu = []

  menu_total.times do |x|
    menu.push("#{food_region.sample} #{star_ingredient.sample} #{food_type.sample}")
  end

  #LOOP PRINTS THE FINAL MENU OF RANDOMIZED MENU ITEMS
  menu_total.times do |i|
    menu_item = menu.sample
    puts "#{i+1}" + ": " + menu_item
  end
end

#OPTION B - USER'S CHOICE MENU GENERATOR METHOD---------------------------------
def users_choice_menu_generator

  #USER ENTRY VALIDATION METHOD (~!But doesn't account for floats)
  def is_numeric?(obj)
     obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) ==
     nil ? false : true
  end

  #PROMPTS USER FOR PREFERRED TOTAL ITEMS ON MENU (user_total)
  puts "You've selected our User's Choice Menu Generator!"
  puts "\nTo proceed, provide the total number of items you would like the generated menu to feature."
  puts "NOTE: The number must be a positive integer. \n\nMenu Item Total?" #~!what's best way of writing the put statements?

  user_total = gets.chomp

  while !(is_numeric?(user_total))
    puts "Remember, positive integers only! "
    user_total = gets.chomp
  end

  menu_total = user_total.to_i

  #USER CHOICE ENTRY INSTRUCTIONS
  puts "\nTo generate a menu item, please enter #{menu_total} choices for each of the following categories:"
  puts "(1) Region of a potential dish, \n(2) Starring main ingredient(s) of a dish, and \n(3) Dish type [e.g. pizza, pasta, salad, curry, etc.]"

  #USER'S CHOICE ENTRY PROMPTS & ARRAYS FOR MENU ITEM COMBINATIONS
  dish_region = []
  star_ingredients = []
  dish_type = []

  menu_total.times do
    puts "\nPlease enter a potential dish's regional cuisine below. (Examples: Italian, Morroccan, Thai, etc.)"
    region_choice = gets.chomp.capitalize
    dish_region.push(region_choice)
  end

  menu_total.times do
  puts "\nPlease enter a starring main ingredient(s) of a dish below:"
    ingredient_choice = gets.chomp.capitalize
    star_ingredients.push(ingredient_choice)
  end

  menu_total.times do
  puts "\nPlease enter a dish type below. (Examples include: pizza, pasta, salad, curry, etc.):"
    dish_choice = gets.chomp.capitalize
    dish_type.push(dish_choice)
  end

  #PULLS 1 RANDOM ELEMENT FROM EACH OF THE 3 ARRAYS AND PUSHES IT INTO THE MENU ARRAY
  menu = []

  menu_total.times do |x|
    menu.push("#{dish_region.sample} #{star_ingredients.sample} #{dish_type.sample}")
  end

  menu_total.times do |i|
    menu_item = menu.sample
    puts "#{i+1}" + ": " + menu_item
  end
end


#_______________________________________________________________________________
introduction

begin_option = gets.chomp.upcase

#------RUNNING OPTION A OR B------

#REPROMPT USER TO ENTER BEGIN OPTION IF begin_option IS NOT A OR B
while true
  if begin_option == "A" || begin_option == "(A)"
    default_menu_generator #RUNS THE DEFAULT MENU GENERATOR METHOD
    Process.exit(0)

  elsif begin_option == "B" || begin_option == "(B)"
    users_choice_menu_generator #RUNS THE USER'S CHOICE MENU GENERATOR METHOD
    Process.exit(0)

  else
    puts "Please enter A or B."
    begin_option = gets.chomp.upcase
  end
end
