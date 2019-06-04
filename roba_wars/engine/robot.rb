require "stringio"
require_relative "run_next_battle"
class Robot

  #This will be the link between both classes
  include RunNextBattle


  def choose_helmet

    puts "Choose your robot's helmet"
    #Display all helmet options to user
    puts $helmet_options
    puts ""
    $player_helmet = $stdin.gets.chomp.to_sym
    #Assign helmet value
    $player_helmet = $player_helmets[$player_helmet]
    if $player_helmet == $player_helmets[:plastic]
      $plastic_helmet_isslected = true
      $player_health += $minor_health
    elsif $player_helmet == $player_helmets[:bucket]
      $bucket_helmet_isselected = true
      $player_health += $medium_health
    elsif $player_helmet == $player_helmets[:worldWar]
      $worldWar_helmet_isselected = true
    elsif $player_helmet == $player_helmets[:angel]
      $angel_helmet_isselected = true
    elsif $player_helmet == $player_helmets[:god]
      $god_helmet_isselected = true
      $player_health += $major_health
    else
      puts "Sorry I didn't get that, try again"
      choose_helmet()
    end
    #Deduct helmet value to current credits
    $current_credits -= $player_helmet
    puts "You now have #{$current_credits} credits left. This is weird"
    puts ""
    choose_tool()
  end



  def choose_tool
      credit_checkpoint = $current_credits
      puts "Now choose your tool for battle"
      puts $tool_options
      puts ""
      $player_tool = $stdin.gets.chomp.to_sym
      $player_tool = $toolsP[$player_tool]
      if $player_tool == $toolsP[:screwdriver]
        $screwdriver_isselected = true
      elsif $player_tool == $toolsP[:woodenShield]
        $wooden_shield_isselected = true
        $player_health += $medium_health
      elsif $player_tool == $toolsP[:machineGun]
        $machine_gun_isselected = true
      elsif $player_tool == $toolsP[:godShield]
        $godShield_isselected = true
        $player_health += $major_health
      else
        puts "Sorry I didn't get that, try again"
        $current_credits = credit_checkpoint

        choose_tool()
      end
      $current_credits -= $player_tool
      #If the user does not have enough credits to purchase the item, ask to purchase another
      if $current_credits < 0
        puts "You don't have enough credits to make the purchase. Try something else"
        $current_credits = credit_checkpoint
        choose_tool()

      else
        puts "You now have #{$current_credits} credits left"
        puts ""
        puts "Now the CPU opponent"
        choose_ai_armor()
        puts "Are you ready for battle?"
        answer = $stdin.gets.chomp
          if answer == "yes" || answer == "Yes"
          battle_it_out()
          else
          $current_credits = credit_checkpoint
          choose_tool()
          end
      end
      return
    end


    def choose_ai_armor

  RunNextBattle.choose_helmet_ai
  RunNextBattle.choose_tool_ai
  end

  def battle_it_out
    RunNextBattle.attack_ai
  end

end #class
