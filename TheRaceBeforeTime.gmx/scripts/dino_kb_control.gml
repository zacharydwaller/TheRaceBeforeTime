with(self)
    {
    // Forward/Backward Movement
    isAccelerating = false;
    
    if(keyboard_check(upKey))
    {
        isAccelerating = true;
        
        speed += acceleration;
    }
    if(keyboard_check(downKey))
    {
        isAccelerating = true;
    
        speed -= acceleration;
    }
    
    if(!isAccelerating && speed > 0)
    {
        speed -= deceleration;
        
        if(speed < 0) speed = 0;
    }
    
    speed = clamp(speed, -maxSpeed, maxSpeed);
    
    // Turning
    var curTurnRate =
        -(1 / maxSpeed) * sqr(abs(speed) - (maxSpeed * 0.5)) + turnRate;
    if(curTurnRate < 0) curTurnRate = 0;
    
    if(keyboard_check(leftKey))
    {
        direction += curTurnRate;
    }
    if(keyboard_check(rightKey))
    {
        direction -= curTurnRate;
    }
}
