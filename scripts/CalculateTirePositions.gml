///CalculateTirePostions(wheelbase,front_wheel_sep,back_wheel_sep)
tfl_x=phy_position_x-lengthdir_x(frontLongSep,dir)-lengthdir_x(frontLatSep,dir+90)
tfl_y=phy_position_y-lengthdir_y(frontLongSep,dir)-lengthdir_y(frontLatSep,dir+90)
tfr_x=phy_position_x-lengthdir_x(frontLongSep,dir)+lengthdir_x(frontLatSep,dir+90)
tfr_y=phy_position_y-lengthdir_y(frontLongSep,dir)+lengthdir_y(frontLatSep,dir+90)
tbl_x=phy_position_x+lengthdir_x(rearLongSep,dir)-lengthdir_x(rearLatSep,dir+90)
tbl_y=phy_position_y+lengthdir_y(rearLongSep,dir)-lengthdir_y(rearLatSep,dir+90)
tbr_x=phy_position_x+lengthdir_x(rearLongSep,dir)+lengthdir_x(rearLatSep,dir+90)
tbr_y=phy_position_y+lengthdir_y(rearLongSep,dir)+lengthdir_y(rearLatSep,dir+90)
//tbr=tire back right, tfl=tire front left, etc.

