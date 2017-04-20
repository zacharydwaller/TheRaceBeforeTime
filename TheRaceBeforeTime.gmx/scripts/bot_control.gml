with(self)
{
    if(countDown > 0) return 0;
    if(isFinished) return 0;
    
    var curAccel = playerAcceleration[playerNumber - 2];

    var path = paths[currentTrack];
    
    // Powerup handling - prioritize boost
    if((current_time - powerupTime) >= powerupDuration)
    {
        isBoosting = false;
        isSlipping = false;
    }
    
    if(isBoosting)
    {
        isSlipping = false;
        curAccel *= 2;
    }
    
    if(isSlipping)
    {
        curAccel /= 4;
    }
    
    // Get next point
    var moveToApproximation = random_range(25, 75);
    var totalPoints = path_get_number(path);

    var nextPointX = path_get_point_x(path, pathIndex);
    var nextPointY = path_get_point_y(path, pathIndex);
    
    var nextPointDistance = point_distance(x,y,nextPointX, nextPointY);
    
    if(nextPointDistance < moveToApproximation)
    {
        pathIndex = (pathIndex + 1) % totalPoints;
    }
    
    //Get direction
    var desiredDirection = point_direction(x, y, nextPointX,nextPointY);
    var directionDiff = angle_difference(desiredDirection, direction);

    direction = lerp(direction, direction + directionDiff, 0.1);
    
    // Brake if needed
    if(abs(directionDiff) > 45)
    {
        phy_speed_x = lerp(phy_speed_x, 0, braking);
        phy_speed_y = lerp(phy_speed_y, 0, braking);
    }

    //Get Speed
    var forward_x = cos(degtorad(desiredDirection)) * curAccel;
    var forward_y = -sin(degtorad(desiredDirection)) * curAccel;
    
    physics_apply_force(x, y, forward_x, forward_y);
}
