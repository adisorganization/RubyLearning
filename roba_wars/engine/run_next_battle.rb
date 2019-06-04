module RunNextBattle
  def self.choose_helmet_ai()
    if $ai_helmets[0] || $ai_helmets[1] || $ai_helmets[2] || $ai_helmets[3] || $ai_helmets[4]
      $ai_helmets = [false,false,false,false,false]
      puts "Ai helmet was replaced"
    end

     if $ai_tools[0] || $ai_tools[1] || $ai_tools[2] || $ai_tools[3]
      $ai_helmets = [false,false,false,false]
      puts "Ai tools were replaced"
     end
    random_helmet = rand(4)
    new_helmet = $helmets[random_helmet]
    #Keeping track of ai Merch
    if new_helmet == $helmets[0]
      puts "The helmet the AI has is plastic."
      $ai_robo_health += $minor_health
      $ai_helmets[0] = true
    elsif new_helmet == $helmets[1]
      puts "The helmet the AI has is bucket."
      $ai_robo_health += $medium_health
      $ai_helmets[1] = true
    elsif new_helmet == $helmets[2]
      $ai_helmets[2] = true
      puts "The helmet the AI has is worldwar."
    elsif new_helmet == $helmets[3]
      puts "The helmet the AI has is angel."
      $ai_helmets[3] = true
    elsif new_helmet == $helmets[4]
      puts "The helmet the AI has is god."
      $ai_robo_health += $major_health
      $ai_helmets[4] = true
    end
  end

  def self.choose_tool_ai()
    random_tool = rand(3)
    new_tool = $tools[random_tool]
    if new_tool == $tools[0]
      puts "The tool the AI has is a screwdriver."
      $ai_tools[0] = true
    elsif new_tool == $tools[1]
      puts "The tool the AI has is a wooden shield."
      $ai_robo_health += $medium_health
      $ai_tools[1] = true
    elsif new_tool == $tools[2]
      puts "The tool the AI has is a machine gun."
      $ai_tools[2] = true
    elsif new_tool == $tools[3]
      puts "The tool the AI has is god shield."
      $ai_robo_health += $major_health
      $ai_tools[3] = true
    end
  end

  def self.attack_ai()

    if $player_is_alive && $ai_is_alive
      if $worldWar_helmet_isselected && $screwdriver_isselected
        $attack = rand(1..20) + (2 * $minor_damage)
        $ai_robo_health -= $attack
      elsif $worldWar_helmet_isselected && $machine_gun_isselected
        $attack = rand(1..20) + $minor_damage + $dramatic_damage
        $ai_robo_health -= $attack
      elsif $worldWar_helmet_isselected || $screwdriver_isselected
        $attack = rand(1..20) + $minor_damage
        $ai_robo_health -= $attack
      elsif $angel_helmet_isselected || $machine_gun_isselected
        $attack = rand(1..20) + $dramatic_damage
        $ai_robo_health -= $attack
      else
        $attack = rand(1..20)
        $ai_robo_health -= $attack
      end


    puts "Player has attacked the opposing robot and now, its HP is #{$ai_robo_health}"
   else
     puts "can not attack"
      return
    end
      if $ai_robo_health < 0
        puts "Player has won the battle"
        puts ""
        $ai_is_alive = false
        #If player wins the battle, they may be rewarded
        $current_credits += $reward
        #Open the store if battle is over
        Store.battle_feedback()
        return
      else
        #If AI is not destroyed, it shall attack player
        attack_player()
      end
  end

  def self.attack_player
    if $ai_is_alive && $player_is_alive
      if $ai_helmets[2] && $ai_tools[0]
        $attack = rand(1..20) + ( 2* $minor_damage)
        $player_health -= $attack
      elsif $ai_helmets[2] && $ai_tools[2]
        $attack = rand(1..20) + $minor_damage + $dramatic_damage
        $player_health -= $attack
      elsif $ai_helmets[2] || $ai_tools[0]
        $attack = rand(1..20) + $minor_damage
        $player_health -= $attack
      elsif $ai_helmets[3] || $ai_tools[2]
        $attack = rand(1..20) + $dramatic_damage
        $player_health -= $attack
      else $attack = rand(1..20)
        $player_health -= $attack
      end
      puts "The opposing robot has attacked and now your HP is #{$player_health}"
    else
      return
    end
      if $player_health < 0
        puts "You have lost the battle"
        puts ""
        #If player loses the battle, they will lose credits
        $current_credits -= $penalty
        $player_is_alive = false
        #Open the store if battle is over
        Store.battle_feedback()
        return
      else
        attack_ai()
      end
  end
end
