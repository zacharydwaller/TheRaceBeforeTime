with(self)
{
    var wallDecel;

    if(abs(speed) < wallDecel)
    {
        speed = 0;
    }
    else if(speed > 0)
    {
        speed -= wallDecel;
    }
    else if(speed < 0)
    {
        speed += wallDecel;
    }

}
