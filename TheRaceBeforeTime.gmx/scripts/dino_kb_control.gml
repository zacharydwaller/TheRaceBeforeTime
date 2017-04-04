with(self)
{
    // Turning
    var curAccel = acceleration;
    var curTurnRate = turnRate;
    isDrifting = false;
    
    if(keyboard_check(driftKey))
    {
        isDrifting = true;
    
        curTurnRate = driftTurnRate;
        curAccel = driftAcceleration;
        
        phy_speed_x = lerp(phy_speed_x, 0, braking / 1.5);
        phy_speed_y = lerp(phy_speed_y, 0, braking / 1.5);
    }
    else
    {
        phy_angular_velocity = lerp(phy_angular_velocity, 0, 1);
    }

    inertia_dir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y);
    
    if(keyboard_check(leftKey))
    {
        phy_rotation += curTurnRate;
        
        if(isDrifting)
        {
            physics_apply_force(x, y, lengthdir_x(driftForce, phy_rotation - 90), lengthdir_y(driftForce, phy_rotation - 90));
        }
    }
    if(keyboard_check(rightKey))
    {
        phy_rotation -= curTurnRate;
        
        if(isDrifting)
        {
            physics_apply_force(x, y, lengthdir_x(driftForce, phy_rotation + 90), lengthdir_y(driftForce, phy_rotation + 90));
        }
    }
    direction = phy_rotation;

    // Forward/Backward Movement 
    var forward_x = cos(degtorad(phy_rotation)) * curAccel;
    var forward_y = -sin(degtorad(phy_rotation)) * curAccel;
    
    if(keyboard_check(upKey))
    {
        physics_apply_force(x, y, forward_x, forward_y);
    }
    if(keyboard_check(downKey))
    {
        if(phy_speed >= 0.5)
        {
            phy_speed_x = lerp(phy_speed_x, 0, braking);
            phy_speed_y = lerp(phy_speed_y, 0, braking);
        }
        else
        {
         physics_apply_force(x, y, -forward_x, -forward_y);
        }
    }
}
