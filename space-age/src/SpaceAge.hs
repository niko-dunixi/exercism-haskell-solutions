module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
-- The constants we are given, are in terms of earth years.
{-
From Exercism:
    Earth: orbital period 365.25 Earth days, or 31557600 seconds
    Mercury: orbital period 0.2408467 Earth years
    Venus: orbital period 0.61519726 Earth years
    Mars: orbital period 1.8808158 Earth years
    Jupiter: orbital period 11.862615 Earth years
    Saturn: orbital period 29.447498 Earth years
    Uranus: orbital period 84.016846 Earth years
    Neptune: orbital period 164.79132 Earth years
-}
-- Thus, we must do all our calculations in terms of Earth years, so
-- we define the function for calculating an age for earth first.
--
-- So given seconds, we want Earth years. We know from the data provided
-- that 1 earth year is 31557600 seconds
-- Thus: 1 EARTH YEAR / 31557600 SECONDS * our input seconds will cancel out
-- seconds and give us our value in earth years.
--
-- The next part is slightly more tricky. We want the year in terms of other
-- planets as well. So we must do more unit math.
-- If 1 Mercury Year = 0.2408467 Earth Years, then we have to take our
-- previously calculated Earth years and cancel out the Earth year.
--
-- We can do so like this:
-- 1 Mercury Year = 0.2408467 Earth Years
-- Input Earth Years / 0.2408467 Earth Years = Mercury Years
-- We've canceled out the Earth years leaving us with Mercury Years.
-- All we must do now, is rinse and repeat for the given years.
ageOn Earth seconds = seconds / 31557600
ageOn Mercury seconds = ageOn Earth seconds / 0.2408467
ageOn Venus seconds = ageOn Earth seconds / 0.61519726
ageOn Mars seconds = ageOn Earth seconds / 1.8808158
ageOn Jupiter seconds = ageOn Earth seconds / 11.862615
ageOn Saturn seconds = ageOn Earth seconds / 29.447498
ageOn Uranus seconds = ageOn Earth seconds / 84.016846
ageOn Neptune seconds = ageOn Earth seconds / 164.79132
