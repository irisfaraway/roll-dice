input = ARGV[0]

def parse_user_input(input)
  # Must have 'd' followed by number, optionally preceded by another number
  # Acceptable examples: d6, 2d10, 99d100
  dice_pattern = /(?<count>[\d]{0,2})d(?<type>[\d]{1,3})/

  unless dice_pattern.match(input)
    puts 'You must enter a valid roll.'
    exit
  end

  die_type = dice_pattern.match(input)[:type].to_i
  die_count = if dice_pattern.match(input)[:count].empty?
                1
              else
                dice_pattern.match(input)[:count].to_i
              end

  [die_type, die_count]
end

def roll_all_dice(die_type, die_count)
  results = []
  die_count.times do
    results << roll(die_type)
  end
  results
end

def roll(die)
  rand(1..die)
end

def show_dice_results(dice)
  puts dice.join(', ')
end

die_type, die_count = parse_user_input(input)
puts "Rolling a d#{die_type} #{die_count} times..."
results = roll_all_dice(die_type, die_count)
show_dice_results(results)
