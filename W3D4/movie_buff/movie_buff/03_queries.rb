require 'byebug'

def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.select(:id, :title)
    .joins(:actors)
    .where(actors: { name: those_actors })
    .group(:id)
    .having("COUNT(*) >= #{those_actors.length}")
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .group('decade')
    .order('AVG(score) DESC')
    .limit(1)
    .pluck('yr/10 * 10 AS decade').first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  Actor
    .joins(:castings)
    .where(castings: { movie_id: Actor.select('castings.movie_id')
                                      .joins(:castings)
                                      .where(name: name)})
    .where("name NOT LIKE '#{name}'")
    .pluck(:name).uniq
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .joins('LEFT OUTER JOIN castings ON castings.actor_id = actors.id')
    .where(castings: { movie_id: nil })
    .pluck('COUNT(*)').first

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  search_string = whazzername.delete(' ').chars.join("%")
  search_string.insert(0, '%')
  search_string.insert(-1, '%')
  Movie
    .joins(:actors)
    .where('UPPER(actors.name) LIKE UPPER(?)', search_string)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  Actor
    .select(:id, :name, 'MAX(movies.yr) - MIN(movies.yr) AS career')
    .joins(:movies)
    .group(:id)
    .order('career DESC', :name)
    .limit(3)
end