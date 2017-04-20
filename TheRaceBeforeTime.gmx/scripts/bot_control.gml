with(self)
{
    if(countDown > 0) return 0;
    if(isFinished) return 0;

    var path = pth_track1;

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

    direction = lerp(direction, direction + directionDiff, 0.05);

    //Get Speed
    speed = maxSpeed / 2;
    
    var desHSpeed = lengthdir_x(speed, direction);
    var desVSpeed = lengthdir_y(speed, direction);
    
    hspeed = lerp(hspeed, desHSpeed, 0.1);
    vspeed = lerp(vspeed, desVSpeed, 0.1);
    
    //Move
    phy_position_x += hspeed;
    phy_position_y += vspeed;
}
