{-# LANGUAGE DataKinds, KindSignatures #-}
module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

getOrbit :: Planet -> Float
getOrbit Mercury =   0.2408467
getOrbit Venus   =   0.61519726
getOrbit Earth   =   1.0
getOrbit Mars    =   1.8808158
getOrbit Jupiter =  11.862615
getOrbit Saturn  =  29.447498
getOrbit Uranus  =  84.016846
getOrbit Neptune = 164.79132


-- Planet p -> Age in seconcs on p -> Age in years on earth
ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / orbital
  where
    orbital = getOrbit planet * 31557600.0

