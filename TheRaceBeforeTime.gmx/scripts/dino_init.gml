with(self)
{
    isDrifting = false;

    maxSpeed = 10;
    
    acceleration = 100;
    driftAcceleration = acceleration / 2;
    braking = 0.02;
    
    turnRate = 3.5;
    driftTurnRate = 5;
    
    driftForce = 50;
    
    halfwayFlag = false;
    
    isFinished = false;
    
    numPlayers++;
}
