require "stringio"

class Store
  #Link between both classes
  include RunNextBattle

  def self.battle_feedback
   random_part_isdamaged()
    puts "Your current credits are at #{$current_credits}"
    if $current_credits < 50
      puts "You do not have enough to continue playing"
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
    answer = $stdin.gets.chomp
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
    answer = $stdin.gets.chomp
    if answer == "buy" || answer == "Buy" || answer == "BUY"
      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = $stdin.gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
      return  next_round()
      elsif second_answer == "Tool" || second_answer == "tool"

        puts $tool_options
      else
        puts "Sorry I didn't get that"
         return try_again_buy()
      end
      elsif answer == "sell" || answer == "Sell" || answer == "SELL"
        puts "Would you like to sell a Helmet or a Tool?"
        second_answer = $stdin.gets.chomp
          if second_answer == "Helmet" || second_answer == "helmet"
            selling_options_forhelmet()
          return  next_round()
        elsif second_answer == "Tool" || second_answer == "tool"

          puts $tool_options
        else
          puts "Sorry I didn't get that"
           return try_again_buy()
        end
      end
  end



  def self.next_round
    puts "Would you like to continue playing?"
    response = $stdin.gets.chomp
      if response == "no" || response == "No"
        return
      else
      RunNextBattle.choose_helmet_ai
      RunNextBattle.choose_tool_ai
      puts "Are you sure you are ready for battle?"
      answer = $stdin.gets.chomp
      if answer == "yes" || answer == "Yes"
        #At the start of every new battle, the fighters will regain theuir max health
        $player_health = $max_health
        $ai_robo_health = $max_health
        if !$player_is_alive
          $player_is_alive = true
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

  def self.try_again_buy

      puts "Would you like to buy a Helmet or a Tool?"
      second_answer = $stdin.gets.chomp
      if second_answer == "Helmet" || second_answer == "helmet"
        puts $helmet_options
        next_round()
      elsif second_answer == "Tool" || second_answer == "tool"
        puts $tool_options
      else
        puts "Sorry I didn't get that"
         return try_again_buy()
      end
   end

   def self.random_part_isdamaged
     $damaged = rand(1..2)
       if $helmet_isdamaged && $damaged == 1
         $helmet_isdestroyed = true
         puts "Your helmet has been destroyed, I reccommend purchasing another before fighting again"
       elsif $tool_isdamaged && $damaged == 2
         $tool_isdestroyed = true
         puts "Your tool has been destroyed, I reccommend purchasing another before fighting again"
       elsif $damaged == 1
         $helmet_isdamaged = true
         puts "Your helmet has been damaged. I reccomend selling it for a better one"
       elsif $damaged == 2
         $tool_isdamaged = true
         puts "Your tool has been damaged. I reccomend selling it for a better one"
       end
   end

   def self.selling_options_forhelmet
       if $plastic_helmet_isslected && $helmet_isdamaged ||
         $bucket_helmet_isselected && $helmet_isdamaged ||
         $worldWar_helmet_isselected && $helmet_isdamaged ||
         $angel_helmet_isselected && $helmet_isdamaged ||
         $god_helmet_isselected && $helmet_isdamaged

         discount = $player_helmet/3
         puts "You could sell it for #{discount}"
       elsif $plastic_helmet_isslected ||
          $bucket_helmet_isselected ||
          $worldWar_helmet_isselected ||
          $angel_helmet_isselected ||
         $god_helmet_isselected

         discount = $player_helmet/2
         puts "You could sell it for #{discount}"
       end
    puts "Do you want to sell?"
    answer = $stdin.gets.chomp
      if answer == "yes" || answer == "Yes"
        $current_credits += discount
        puts "You currently have #{$current_credits} credits"
        #Player no longer has a helmet afeter selling
        $plastic_helmet_isslected = false
        $bucket_helmet_isselected = false
        $worldWar_helmet_isselected = false
        $angel_helmet_isselected = false
        $god_helmet_isselected = false
      else
        open_shop()
      end
   end

    def self.buying_options_forhelmet
      #If user currently has a helmet, they cannot buy
      if $plastic_helmet_isslected || $bucket_helmet_isselected || $worldWar_helmet_isselected || $angel_helmet_isselected || $god_helmet_isselected
        puts "I can't sell you a helmet, unless you sell your current helmet"
        open_shop()
      else
        puts $helmet_options
        puts ""
        puts "What would you like to buy? "
        new_helmet()
        open_shop()
      end
    end

    def self.new_helmet
      second_answer = $stdin.gets.chomp.to_sym
      new_helmet = $player_helmets[second_answer]
      if new_helmet == $player_helmets[:plastic]
        $plastic_helmet_isslected = true
        $player_health += $minor_health
      elsif new_helmet == $player_helmets[:bucket]
        $bucket_helmet_isselected = true
        $player_health += $medium_health
      elsif new_helmet == $player_helmets[:worldWar]
        $worldWar_helmet_isselected = true
      elsif new_helmet == $player_helmets[:angel]
        $angel_helmet_isselected = true
      elsif new_helmet == $player_helmets[:god]
        $god_helmet_isselected = true
        $player_health += $major_health
    end

  end#class
