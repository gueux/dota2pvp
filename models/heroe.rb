class Heroe < ActiveHash::Base

  HEROES_FILE = File.join(Dota2StatsMan.settings.root, Dota2StatsMan.settings.heroes_json)

  heroes_in_json = JSON.parse(File.read(HEROES_FILE))["DOTAHeroes"]

  self.data = heroes_in_json.select { |key, value| key != 'Version' }
                            .map do |key, value| 
                              name = key.sub('npc_dota_hero_','')
                              {
                                "BaseName" => key,
                            	"Name" => name,
                            	"image_lg" => "heroes/#{name}_lg.png",
                            	"image_sb" => "heroes/#{name}_sb.png",
                            	"image_vert" => "heroes/#{name}_vert.png",
                            	"image_full" => "heroes/#{name}_full.png"
                              }
                              .merge(value)
                            end
  class << self
  	def base
  	  Heroe.all.find_by_name "base"
  	end
  end
end
	