module Simulation (moveParticle, accelerate, advanceWorld) where
  
import World
import Physics

-- Move a particle according to its velocity for the given number of (simulated) seconds.
--
moveParticle :: Float -> Particle -> Particle
moveParticle = error "You need to implement Simulation.moveParticle"
    
-- Accelerate a particle in dependence on the gravitational force excerted by all other particles for
-- the given number of (simulated) seconds.
--
accelerate :: Float -> [Particle] -> [Particle]
accelerate = error "You need to implement Simulation.accelerate"

-- Progressing the world state
--
advanceWorld :: unused -> Float -> World -> World
advanceWorld = error "You need to implement Simulation.advanceWorld"
