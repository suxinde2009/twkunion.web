# encoding: utf-8
module RPG
  class AudioFile
    def initialize(name = "", volume = 100, pitch = 100)
      @name = name
      @volume = volume
      @pitch = pitch
    end
    attr_accessor :name
    attr_accessor :volume
    attr_accessor :pitch
  end
  class BGM < AudioFile
    @@last = BGM.new
    def play
      if @name.empty?
        Audio.bgm_stop
        @@last = BGM.new
      else
        Audio.bgm_play("Audio/BGM/" + @name, @volume, @pitch)
        @@last = self
      end
    end
    def self.stop
      Audio.bgm_stop
      @@last = BGM.new
    end
    def self.fade(time)
      Audio.bgm_fade(time)
      @@last = BGM.new
    end
    def self.last
      @@last
    end
  end
  class BGS < AudioFile
    @@last = BGS.new
    def play
      if @name.empty?
        Audio.bgs_stop
        @@last = BGS.new
      else
        Audio.bgs_play("Audio/BGS/" + @name, @volume, @pitch)
        @@last = self
      end
    end
    def self.stop
      Audio.bgs_stop
      @@last = BGS.new
    end
    def self.fade(time)
      Audio.bgs_fade(time)
      @@last = BGS.new
    end
    def self.last
      @@last
    end
  end
  class EventCommand
    def initialize(code = 0, indent = 0, parameters = [])
      @code = code
      @indent = indent
      @parameters = parameters
    end
    attr_accessor :code
    attr_accessor :indent
    attr_accessor :parameters
  end
  class CommonEvent
    def initialize
      @id = 0
      @name = ""
      @trigger = 0
      @switch_id = 1
      @list = [RPG::EventCommand.new]
    end
    attr_accessor :id
    attr_accessor :name
    attr_accessor :trigger
    attr_accessor :switch_id
    attr_accessor :list
  end
  class MoveCommand
    def initialize(code = 0, parameters = [])
      @code = code
      @parameters = parameters
    end
    attr_accessor :code
    attr_accessor :parameters
  end
  class MoveRoute
    def initialize
      @repeat = true
      @skippable = false
      @wait = false
      @list = [RPG::MoveCommand.new]
    end
    attr_accessor :repeat
    attr_accessor :skippable
    attr_accessor :wait
    attr_accessor :list
  end
  class Event
    def initialize(x, y)
      @id = 0
      @name = ""
      @x = x
      @y = y
      @pages = [RPG::Event::Page.new]
    end
    attr_accessor :id
    attr_accessor :name
    attr_accessor :x
    attr_accessor :y
    attr_accessor :pages
  end
  class Event
    class Page
      def initialize
        @condition = RPG::Event::Page::Condition.new
        @graphic = RPG::Event::Page::Graphic.new
        @move_type = 0
        @move_speed = 3
        @move_frequency = 3
        @move_route = RPG::MoveRoute.new
        @walk_anime = true
        @step_anime = false
        @direction_fix = false
        @through = false
        @priority_type = 0
        @trigger = 0
        @list = [RPG::EventCommand.new]
      end
      attr_accessor :condition
      attr_accessor :graphic
      attr_accessor :move_type
      attr_accessor :move_speed
      attr_accessor :move_frequency
      attr_accessor :move_route
      attr_accessor :walk_anime
      attr_accessor :step_anime
      attr_accessor :direction_fix
      attr_accessor :through
      attr_accessor :priority_type
      attr_accessor :trigger
      attr_accessor :list
    end
    class Page
      class Condition
        def initialize
          @switch1_valid = false
          @switch2_valid = false
          @variable_valid = false
          @self_switch_valid = false
          @item_valid = false
          @actor_valid = false
          @switch1_id = 1
          @switch2_id = 1
          @variable_id = 1
          @variable_value = 0
          @self_switch_ch = "A"
          @item_id = 1
          @actor_id = 1
        end
        attr_accessor :switch1_valid
        attr_accessor :switch2_valid
        attr_accessor :variable_valid
        attr_accessor :self_switch_valid
        attr_accessor :item_valid
        attr_accessor :actor_valid
        attr_accessor :switch1_id
        attr_accessor :switch2_id
        attr_accessor :variable_id
        attr_accessor :variable_value
        attr_accessor :self_switch_ch
        attr_accessor :item_id
        attr_accessor :actor_id
      end
      class Graphic
        def initialize
          @tile_id = 0
          @character_name = ""
          @character_index = 0
          @direction = 2
          @pattern = 0
        end
        attr_accessor :tile_id
        attr_accessor :character_name
        attr_accessor :character_index
        attr_accessor :direction
        attr_accessor :pattern
      end
    end
  end
end
class Game_System
  attr_accessor :timer                    
  attr_accessor :timer_working            
  attr_accessor :save_disabled            
  attr_accessor :menu_disabled            
  attr_accessor :encounter_disabled       
  attr_accessor :save_count               
  attr_accessor :version_id               
  def initialize
    @timer = 0
    @timer_working = false
    @save_disabled = false
    @menu_disabled = false
    @encounter_disabled = false
    @save_count = 0
    @version_id = 0
  end
end
class Game_Message
  attr_accessor :texts                    
  attr_accessor :face_name                
  attr_accessor :face_index               
  attr_accessor :background               
  attr_accessor :position                 
  attr_accessor :main_proc                
  attr_accessor :choice_proc              
  attr_accessor :choice_start             
  attr_accessor :choice_max               
  attr_accessor :choice_cancel_type       
  attr_accessor :num_input_variable_id    
  attr_accessor :num_input_digits_max     
  attr_accessor :visible                  
  def initialize
    @texts = []
    @face_name = ""
    @face_index = 0
    @background = 0
    @position = 2
    @main_proc = nil
    @choice_start = 99
    @choice_max = 0
    @choice_cancel_type = 0
    @choice_proc = nil
    @num_input_variable_id = 0
    @num_input_digits_max = 0
    @visible = false
  end
end
class Game_Switches
  def initialize
    @data = []
  end
end
class Game_Variables
  def initialize
    @data = []
  end
end
class Game_SelfSwitches
  def initialize
    @data = {}
  end
end
class Game_MoveListElement
  attr_reader :type,:args
  def initialize(type, args)
    @type = type
    @args = args
  end
end
class Game_Actors
  def initialize
    @data = []
  end
end
class Game_Character
  attr_reader   :id                       
  attr_reader   :x                        
  attr_reader   :y                        
  attr_reader   :real_x                   
  attr_reader   :real_y                   
  attr_reader   :tile_id                  
  attr_reader   :character_name           
  attr_reader   :character_index          
  attr_reader   :opacity                  
  attr_reader   :blend_type               
  attr_reader   :direction                
  attr_reader   :pattern                  
  attr_reader   :move_route_forcing       
  attr_reader   :priority_type            
  attr_reader   :through                  
  attr_reader   :bush_depth               
  attr_accessor :animation_id             
  attr_accessor :balloon_id               
  attr_accessor :transparent              
  def initialize
    @tap_count = 0
    @id = 0
    @x = 0
    @y = 0
    @real_x = 0
    @real_y = 0
    @tile_id = 0
    @character_name = ""
    @character_index = 0
    @opacity = 255
    @blend_type = 0
    @direction = 2
    @pattern = 1
    @move_route_forcing = false
    @priority_type = 1
    @through = false
    @bush_depth = 0
    @animation_id = 0
    @balloon_id = 0
    @transparent = false
    @original_direction = 2               
    @original_pattern = 1                 
    @move_type = 0                        
    @move_speed = 4                       
    @move_frequency = 6                   
    @move_route = nil                     
    @move_route_index = 0                 
    @original_move_route = nil            
    @original_move_route_index = 0        
    @walk_anime = true                    
    @step_anime = false                   
    @direction_fix = false                
    @anime_count = 0                      
    @stop_count = 0                       
    @jump_count = 0                       
    @jump_peak = 0                        
    @wait_count = 0                       
    @locked = false                       
    @prelock_direction = 0                
    @move_failed = false      
    @bush_depth = 0            
  end
end
class Game_Event < Game_Character
  attr_reader   :trigger                  
  attr_reader   :list                     
  attr_reader   :starting                 
  def initialize(map_id, event)
    super()
    @map_id = map_id
    @event = event
    @id = @event.id
    @erased = false
    @starting = false
    @through = true
    @trigger = 0
    @page = nil
    @list = nil
  end
end
class Game_Follower < Game_Character
  attr_reader   :actor
  attr_accessor :move_speed
  def initialize(actor)
    super()
    @through = true
    @actor = actor
    @move_speed = 0
  end
end
class Game_BattleAction
  attr_accessor :battler                  
  attr_accessor :speed                    
  attr_accessor :kind                     
  attr_accessor :basic                    
  attr_accessor :skill_id                 
  attr_accessor :item_id                  
  attr_accessor :target_index             
  attr_accessor :forcing                  
  attr_accessor :value                    
  def initialize(battler)
    @battler = battler
    @e = 0
    @speed = 0
    @kind = 0
    @basic = -1
    @skill_id = 0
    @item_id = 0
    @target_index = -1
    @forcing = false
    @value = 0
    @e = 0
  end
end
class Game_Battler
  attr_accessor :battler_name             
  attr_reader   :battler_hue              
  attr_reader   :hp                       
  attr_reader   :mp                       
  attr_accessor :oldhp                    
  attr_accessor :oldmp                    
  attr_accessor :oldap   
  attr_accessor :ap 
  attr_reader   :action                   
  attr_accessor :hidden                   
  attr_accessor :immortal                 
  attr_accessor :animation_id             
  attr_accessor :animation_mirror         
  attr_accessor :white_flash              
  attr_accessor :blink                    
  attr_accessor :collapse                 
  attr_reader   :skipped                  
  attr_reader   :missed                   
  attr_reader   :evaded                   
  attr_reader   :critical                 
  attr_reader   :absorbed                 
  attr_reader   :hp_damage                
  attr_reader   :mp_damage                
  attr_reader   :guarded
  attr_accessor :class_id
  def initialize
    @battler_name = ""
    @class_id = ""
    @battler_hue = 0
    @hp = 0
    @mp = 0
    @ap = 0
    @action = Game_BattleAction.new(self)
    @states = []                    
    @state_turns = {}               
    @hidden = false   
    @immortal = false
    @oldhp=0
    @oldmp=0
    @oldap=0
    @fc_at_e = 0
    @fc_df_e = 0
    @fc_sr_e = 0
    @fc_de_e = 0
    @fc_nt_e = 0
    @fc_ag_e  = 0
    @fc_hit_e = 0
    @fc_eva_e = 0
    @fc_cri_e = 0
    @maxhp_plus = 0
    @maxmp_plus = 0
    @atk_plus = 0
    @def_plus = 0
    @spi_plus = 0
    @agi_plus = 0
    @ap_plus = 0
    @animation_id = 0
    @animation_mirror = false
    @white_flash = false
    @blink = false
    @collapse = false
    @skipped = false
    @missed = false
    @guarded = false
    @evaded = false
    @critical = false
    @absorbed = false
    @hp_damage = 0
    @mp_damage = 0
    @added_states = []
    @removed_states = []
    @remained_states = []
  end
end
class Game_Enemy < Game_Battler
  attr_reader   :index                    
  attr_reader   :enemy_id                 
  attr_reader   :original_name            
  attr_accessor :letter                   
  attr_accessor :plural                   
  attr_accessor :screen_x                 
  attr_accessor :screen_y                  
  attr_accessor :fc_at_e
  attr_accessor :fc_df_e
  attr_accessor :fc_sr_e
  attr_accessor :fc_de_e
  attr_accessor :fc_nt_e
  attr_accessor :fc_ag_e
  attr_accessor :fc_hit_e
  attr_accessor :fc_eva_e
  attr_accessor :fc_cri_e
  attr_accessor :str                 
  attr_accessor :dex                 
  def initialize
    super()
    @index = 0
    @enemy_id = 0
    @original_name = ""
    @letter = ''
    @plural = false
    @screen_x = 0
    @screen_y = 0
    @battler_name = ""
    @battler_hue = 0
    @hp = 0
    @mp = 0   
  end
end
class Game_Actor < Game_Battler
  attr_reader   :name                     
  attr_reader   :character_name           
  attr_reader   :character_index          
  attr_reader   :face_name                
  attr_reader   :face_index               
  attr_accessor :class_id                
  attr_reader   :weapon_id                
  attr_reader   :armor1_id                
  attr_reader   :armor2_id                
  attr_reader   :armor3_id                
  attr_reader   :armor4_id                
  attr_reader   :level                    
  attr_reader   :exp                      
  attr_accessor :last_skill_id            
  attr_accessor :oldhp                    
  attr_accessor :oldmp                    
  attr_accessor :oldap
  attr_accessor :ap
  attr_accessor :battx                    
  attr_accessor :batty                    
  attr_accessor :battx2                   
  attr_accessor :batty2                   
  attr_accessor :screen_x                 
  attr_accessor :screen_y          
  attr_accessor :battx3           
  attr_accessor :fc_at
  attr_accessor :fc_df
  attr_accessor :fc_sr
  attr_accessor :fc_de
  attr_accessor :fc_nt
  attr_accessor :fc_ag  
  attr_accessor :fc_hit
  attr_accessor :fc_eva
  attr_accessor :fc_cri
  attr_accessor :str
  attr_accessor :dex
  attr_accessor :ap 
  def initialize
    super()
    @battx = 0
    @batty = 0
    @battx2 = 0
    @batty2 = 0
    @battx3 = 0
    @fc_hp = 0
    @fc_at = 0
    @fc_df = 0
    @fc_sr = 0
    @fc_de = 0
    @fc_nt = 0
    @fc_ag = 0
    @fc_hit = 0
    @fc_eva = 0
    @fc_cri = 0
    @battler_name = ""
    @battler_name = ""
    @battler_hue = 0
    @actor_id = 0
    @name = ""
    @character_name = ""
    @character_index = 0
    @face_name = ""
    @face_index = 0
    @class_id = 0
    @battler_name = ""
    @weapon_id = 0
    @armor1_id = 0
    @armor2_id = 0
    @armor3_id = 0
    @armor4_id = 0
    @level = 0
    @exp_list = Array.new(101)
    @exp = 0
    @skills = []
    @last_skill_id = 0
  end
end

class Game_Unit
  def initialize
  end
end
class Game_Party < Game_Unit
  attr_reader   :gold                     
  attr_reader   :steps                    
  attr_accessor :last_item_id             
  attr_accessor :last_actor_index         
  attr_accessor :last_target_index        
  def initialize
    super
    @gold = 0
    @steps = 0
    @last_item_id = 0
    @last_actor_index = 0
    @last_target_index = 0
    @actors = []      
    @items = {}       
    @weapons = {}     
    @armors = {}      
  end
end
class Color
  attr_accessor  :red
  attr_accessor  :green
  attr_accessor  :blue
  attr_accessor  :alpha
  def initialize(r,g,b,a)
    @red = red
    @green = green
    @blue = blue
    @alpha = a
  end
end
class Tone
  attr_accessor  :red
  attr_accessor  :green
  attr_accessor  :blue
  attr_accessor  :gray
  def initialize(r,g,b,gr)
    @red = red
    @green = green
    @blue = blue
    @gray = gr
  end
end
class Game_Picture
  attr_reader   :number                   
  attr_reader   :name                     
  attr_reader   :origin                   
  attr_reader   :x                        
  attr_reader   :y                        
  attr_reader   :zoom_x                   
  attr_reader   :zoom_y                   
  attr_reader   :opacity                  
  attr_reader   :blend_type               
  attr_reader   :tone                     
  attr_reader   :angle                    
  def initialize(number)
    @number = number
    @name = ""
    @origin = 0
    @x = 0.0
    @y = 0.0
    @zoom_x = 100.0
    @zoom_y = 100.0
    @opacity = 255.0
    @blend_type = 1
    @duration = 0
    @target_x = @x
    @target_y = @y
    @target_zoom_x = @zoom_x
    @target_zoom_y = @zoom_y
    @target_opacity = @opacity
    @tone = Tone.new(0, 0, 0, 0)
    @tone_target = Tone.new(0, 0, 0, 0)
    @tone_duration = 0
    @angle = 0
    @rotate_speed = 0
  end
end
class Game_Screen
  attr_reader   :brightness               
  attr_reader   :tone                     
  attr_reader   :flash_color              
  attr_reader   :shake                    
  attr_reader   :pictures                 
  attr_reader   :weather_type             
  attr_reader   :weather_max              
  def initialize
    @brightness = 255
    @fadeout_duration = 0
    @fadein_duration = 0
    @tone = Tone.new(0, 0, 0, 0)
    @tone_target = Tone.new(0, 0, 0, 0)
    @tone_duration = 0
    @flash_color = Color.new(0, 0, 0, 0)
    @flash_duration = 0
    @shake_power = 0
    @shake_speed = 0
    @shake_duration = 0
    @shake_direction = 1
    @shake = 0
    @pictures = []
    @weather_type = 0
    @weather_max = 0.0
    @weather_type_target = 0
    @weather_max_target = 0.0
    @weather_duration = 0
  end
end
class Game_Interpreter
 def initialize(depth = 0, main = false)
    @depth = depth
    @main = main
    @map_id = 0                       
    @original_event_id = 0            
    @event_id = 0                     
    @list = nil                       
    @index = 0                        
    @message_waiting = false          
    @moving_character = nil           
    @wait_count = 0                   
    @child_interpreter = nil          
    @branch = {}                      
    clear
  end
end


class Game_Vehicle < Game_Character
  attr_reader   :type                     
  attr_reader   :altitude                 
  attr_reader   :driving                  
  def initialize(type)
    super()
    @type = type
    @altitude = 0
    @driving = false
    @direction = 4
    @walk_anime = false
    @step_anime = false
    @character_name = ""
    @character_index = 0
    @bgm = nil
    @map_id = 0
    @x = 0
    @y = 0
  end
end

class Game_Troop < Game_Unit
  attr_reader   :screen                   
  attr_reader   :interpreter              
  attr_reader   :event_flags              
  attr_reader   :turn_count               
  attr_reader   :name_counts              
  attr_accessor :can_escape               
  attr_accessor :can_lose                 
  attr_accessor :preemptive               
  attr_accessor :surprise                 
  attr_accessor :turn_ending              
  attr_accessor :forcing_battler          
  attr_accessor :oldhp2                 
  def initialize
    super
    @screen = Game_Screen.new
    @interpreter = Game_Interpreter.new
    @event_flags = {}
    @screen.clear
    @interpreter.clear
    @event_flags.clear
    @enemies = []
    @turn_count = 0
    @names_count = {}
    @can_escape = false
    @can_lose = false
    @preemptive = false
    @surprise = false
    @turn_ending = false
    @forcing_battler = nil
  end
end
class Game_Map
  attr_reader   :screen                   
  attr_reader   :interpreter              
  attr_reader   :display_x                
  attr_reader   :display_y                
  attr_reader   :parallax_name            
  attr_reader   :passages                 
  attr_reader   :events                   
  attr_reader   :vehicles                 
  attr_accessor :need_refresh             
  def initialize
    @screen = Game_Screen.new
    @interpreter = Game_Interpreter.new(0, true)
    @map_id = 0
    @display_x = 0
    @display_y = 0
    @map_id = map_id
    @display_x = 0
    @display_y = 0
    @passages = []
    @vehicles = []
    @events = {}
    @scroll_direction = 2
    @scroll_rest = 0
    @scroll_speed = 4
    @margin_x = 0     
    @margin_y = 0    
    @parallax_name = ""
    @parallax_loop_x = 0
    @parallax_loop_y = 0
    @parallax_sx = 0
    @parallax_sy = 0
    @parallax_x = 0
    @parallax_y = 0
    @need_refresh = false
  end
end
class Game_Player < Game_Character
  attr_reader   :vehicle_type       
  def initialize
    super
    @vehicle_type = -1
    @vehicle_getting_on = false     
    @vehicle_getting_off = false    
    @transferring = false           
    @new_map_id = 0                 
    @new_x = 0                      
    @new_y = 0                      
    @new_direction = 0              
    @walking_bgm = nil     
  end
end         

