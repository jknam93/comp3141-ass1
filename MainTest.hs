module Main where
  
import Test.QuickCheck
import Test
import Simulation

main = quickCheck prop_EnergyConservation
