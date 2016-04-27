module Test where

import Test.QuickCheck
import Simulation
import Physics
import World
import TestSupport

prop_EnergyConservation:: World -> Bool
prop_EnergyConservation w =  ratio > 0.999 && ratio < 1.001
   where
      energy   = worldEnergy w + 1
      energy'  = worldEnergy (advanceWorld 1 0.001 w) + 1
      ratio    = abs (realToFrac (energy / energy'))

