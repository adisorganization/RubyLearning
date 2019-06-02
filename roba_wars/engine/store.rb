class Store
  #Link between both classes
  include RunNextBattle

  def self.battle_feedback
    puts "Your current credits are at #{$current_credits}"
    if $current_credits < 50
      return
    else
    feedback = [
      "That was a battle of the ages. Would you require of the shop for the next?",
      "I've seen better. Maybe try using the store for the next battle. So?",
      "That was quite the spectactle. Wanna get something from the store for the next?",
      "That was ok, but I know you can do better. Wanna see the store?",
    ]
    random_feedback = rand(3)
    aftermath_feedback = feedback[random_feedback]
    puts aftermath_feedback
    answer = gets.chomp
      if answer == "yes" || answer == "Yes" || answer == "YES"
      open_shop()
      else
      next_round()
      end
    end
  end

  #This will show up when the user accesses the shop
  def self.open_shop
    puts "This is the shop"
    puts ""
    puts "Would you like to buy or sell?"
    answer = gets.chomp
    if answer == "buy" || answer == "Buy" || answer == "BUY"
      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
      elsif second_answer == "Tool" || second_answer == "tool"
        puts $tool_options
      else
        puts "Sorry I didn't get that"
        try_again_buy()
      end
    elsif answer == "sell" || answer == "Sell" || answer == "SELL"
      puts "Would you like to sell a Helmet or a Tool?"
    end
  end



  def self.next_round
    puts "Would you like to continue playing?"
    response = gets.chomp
      if response == "no" || response == "No"
        return
      else
      RunNextBattle.choose_helmet_ai
      RunNextBattle.choose_tool_ai
      puts "Are you sure you are ready for battle?"
      answer = gets.chomp
      if answer == "yes" || answer == "Yes"
        #At the start of every new battle, the fighters will regain theuir max health
        $player_health = $max_health
        $ai_robo_health = $max_health
        if !$player_is_alive
          player_is_alive = true
          RunNextBattle.attack_ai
        elsif !$ai_is_alive
          $ai_is_alive = true
          RunNextBattle.attack_ai
        end

      else
        open_shop()
      end
    end
  end

  def try_again_buy

      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
      elsif second_answer == "Tool" || second_answer == "tool"
        puts $tool_options
      else
        puts "Sorry I didn't get that"
        try_again()
      end
   end

  end#class
