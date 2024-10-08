> module City  where

> import System.IO
> import Data.Char (toLower)


- In French, cities generally take the preposition à (used for living in or going to.).
- à + le becomes au
  J’habite au Caire.  I live in Cairo.

> data City = City String  deriving Show

> makePrepositional :: City -> String
> makePrepositional (City city) =
>  if map toLower (take 2 city) == "le" then
>    "Au " ++ drop 3 city
>  else
>    "A " ++  city

> makeCity c = City c


-- IO

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
