class Heroe

  ALL_HEROES_URL = Dota2StatsMan.settings.heroes_stats_url

  class << self
    def all
      heroes = JSON.parse(open(ALL_HEROES_URL).read).values
    end
  end
end
	