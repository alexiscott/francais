> module City  where

> import System.IO
> import Data.Char (toLower)



In French, cities generally take the preposition à. For example:

Tu habites à Paris ?  Do you live in Paris?

Je veux aller à New York.  I want to go to New York.

> data City = City String  deriving Show

> makePrepositional :: City -> String
> makePrepositional (City city) =
>  if map toLower (take 2 city) == "le" then
>    "Au " ++ drop 3 city
>  else
>    "A " ++  city

> makeCity c = City c


-- IO Stuff

> getCities :: IO [City]
> getCities = do
>  h <- openFile "/home/alex/DOCS/FRANCES/grammar/cities.txt" ReadMode -- Use env variable for home path?
>  s <- hGetContents h
>  let result = lines s
>  let cities = map makeCity result
>  return cities

> main :: IO ()
> main = do
>    cities <- getCities                -- Get the list of cities
>    let prepositionalCities = map makePrepositional cities  -- Apply makePrepositional
>    mapM_ putStrLn prepositionalCities  -- Print each prepositional string


However, there are a few points to remember. As you may know, à + le
becomes au, so cities starting with Le (for example Le Caire – Cairo)
require a contraction after à. For example:

J’habite au Caire.  I live in Cairo.

Je vais au Mans.  I’m going to Le Mans.

These contractions apply exclusively to cities that begin with
Le. Other well-known examples are Le Cap (Cape Town) and the French
port town of Le Havre.

You may have noticed something crucial from all of these examples: à
can translate as “in” or “to”. There is only one option for the
preposition in French, covering the idea of both being “in” and going
“to” a city.
