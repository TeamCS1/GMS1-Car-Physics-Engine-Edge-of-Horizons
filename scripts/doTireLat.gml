///grip;
var dir,vel,velDir,latVel,latGrip,aoa,pajecka;
dir=-phy_rotation-90;
vel=point_distance(0,0,phy_speed_x,phy_speed_y);
velDir=point_direction(0,0,phy_speed_x,phy_speed_y)+180;
latVel=dot_product(lengthdir_x(1,dir-90),lengthdir_y(1,dir-90),lengthdir_x(vel,velDir+180),lengthdir_y(vel,velDir+180)); //latitudal velocity, in pixels


if par.longVel>0 //feed the aoa values
aoa=abs(angle_difference(dir,velDir));
if par.longVel<0 //if going in reverse, flip the velDir
aoa=abs(angle_difference(dir,velDir+180));

//pajecka's magic tire formula
pajecka=0;
if par.longVel!=0 {
if aoa<6
pajecka=1-aoa/6//if the velDir angle is less than 6
else if aoa<10
pajecka=0;
if aoa>9.99 
pajecka=-(10-aoa)/40
} else pajecka=0; 

latGrip=argument0/(1+pajecka);

if id==other.tb //the E brake should only apply to the Back wheel.
var dirRatio=min(1,ConvertToMph(vel)/500+par.brake*.65); //e-brake only effects one wheel, so reduce the strength of it.
else
var dirRatio=min(1,ConvertToMph(vel)/500);


phy_speed_x+=lengthdir_x(clamp(latVel,-latGrip,latGrip)*(1-dirRatio),dir+90);
phy_speed_y+=lengthdir_y(clamp(latVel,-latGrip,latGrip)*(1-dirRatio),dir+90);

phy_speed_x+=lengthdir_x(clamp(vel,-latGrip/4,latGrip/4)*(dirRatio),velDir); //warp the tires the faster it goes. //wrench the tire to be going the Vel direction, the faster it is going
phy_speed_y+=lengthdir_y(clamp(vel,-latGrip/4,latGrip/4)*(dirRatio),velDir); //of it Braking freezes the tires, 100% cancel the angle it is going, rather than lateral cancel.


//smoke FX
//rear smoke
if id==other.tb
        if !global.threeD { 
        if abs(latVel)>latGrip
        {instance_create(other.tbl_x,other.tbl_y,fx_smoke);
        instance_create(other.tbr_x,other.tbr_y,fx_smoke);}}
        else
        {      
        if abs(latVel)>latGrip*(8-par.brake*2)
        {with instance_create(other.tbl_x,other.tbl_y,fx_smoke3d) {hspeed=other.phy_speed_x; vspeed=other.phy_speed_y;}
        with instance_create(other.tbr_x,other.tbr_y,fx_smoke3d) {hspeed=other.phy_speed_x; vspeed=other.phy_speed_y;}}
        }

        //front smoke 
        /* 
if id==other.tf
if abs(latVel)>latGrip*12
        if !global.threeD {
        instance_create(other.tfl_x,other.tfl_y,fx_smoke);
        instance_create(other.tfr_x,other.tfr_y,fx_smoke);}
        else
        {      
        with instance_create(other.tfl_x,other.tfl_y,fx_smoke3d) {hspeed=other.phy_speed_x; vspeed=other.phy_speed_y;}
        with instance_create(other.tfr_x,other.tfr_y,fx_smoke3d) {hspeed=other.phy_speed_x; vspeed=other.phy_speed_y;}
        }
