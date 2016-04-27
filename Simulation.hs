module Simulation (moveParticle, accelerate, advanceWorld) where
  
import World
import Physics
import Test.QuickCheck

-- Move a particle according to its velocity for the given number of (simulated) seconds.
--

moveParticle :: Float -> Particle -> Particle
moveParticle t (Particle m (x, y) v@(vx, vy)) = Particle m (x + x', y + y') v
   where
      x' = vx * t
      y' = vy * t
    
-- Accelerate a particle in dependence on the gravitational force excerted by all other particles for
-- the given number of (simulated) seconds.
--
accelerate :: Float -> [Particle] -> [Particle]
accelerate t ps = map (update t ps) ps
   where
      update:: Float -> [Particle] -> Particle -> Particle
      update t ps this@(Particle m pos (vx, vy)) = Particle m pos (vx + ax*t, vy + ay*t)
         where 
            (ax, ay) = sumForce t ps this
      sumForce:: Float -> [Particle] -> Particle -> Accel
      sumForce _ [] _ = (0.0, 0.0)
      sumForce t (p:ps) targetParticle = (ax' + xSum, ay' + ySum)
         where
            (ax', ay') = force targetParticle p
            (xSum, ySum) = sumForce t ps targetParticle
--
advanceWorld :: unused -> Float -> World -> World
advanceWorld _ s w@(World lScale mScale tScale []) = w
advanceWorld _ s (World lScale mScale tScale ps) = World lScale mScale tScale newPositions
   where
      t = s / tScale
      newVelocities = accelerate t ps
      newPositions = map (moveParticle t) newVelocities
