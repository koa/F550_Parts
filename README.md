F550_Parts
==========

3D Printed Parts for mounting Pixhawk and Gimbal to a F550

This Parts connects the folowing parts together:

 * DJI F550 ARF kit
 * Pixhawk flightcontroller with GPS and Data Link (https://store.3drobotics.com/products/3dr-pixhawk)
 * a brushless gimbal (http://www.ready2fly.com/pi/Ready2fly-GoPro-Brushless.html)
 * Spektrum dsmx receiver (http://www.spektrumrc.com/Products/Default.aspx?ProdID=SPM9645)
 * Spektrum DX8 (http://www.spektrumrc.com/Products/Default.aspx?ProdId=SPMR8800)
 * a old Nexus 7
 
There is all designed with openscad (http://www.openscad.org/)

gimbal-mount.scad
-----------------

The gimbal mount fits to the bottom plate of the f550 and has the holes for the gimbal.

gear.scad
---------

This file has 3 parts:
 
 * gear(); The gear for the back with a stabilizer
 * gear("gear_front.dxf"); The gear for the front without a stabilizer
 * gear_stablilizer(); The 2 stabilizers on the site
 
The "gear_stabilizer();" can be printet with very few fill to keep it light (5%)
 
compass.scad
------------

A GPS and buzzer holder for mounting both on the top of F550.
Mount it with small cable ties on the frame. It has also holes to fix the compass and the buzzer with a cable tie.

rc_holder.scad
--------------

There are some parts to mount the Spektrum DSMX Remote Receiver and the 3dr Radio on the top of F550.
 
 * base_fix(); A base for mounting fixing the bottom_part() with a cable tie on place.
 * bottom_part(); On this part you can fix the DSMX Remote Receiver
 * top_part(); This can be clipped into the bottom part and takes the 3dr Radio and the safety switch.
 
tablet_mound.scad
-----------------

As last there is a construction to mount the Nexus 7 (v1) and his 3dr to the DX8 Receiver.

 * side(); there is the main construction to mount the tablet on the DX8. Print it twice, mirrored.
 * base_stabilizer(); Base to mount unter the DX8 to stabilize both sides. It can be clipped into the sides.
 * back_stabilizer(); Stabilizer behind the Nexus 7. Clipped into both sides and mounts the 3dr Radio.
 * side_small(); A mini version of the side(); to mount the 3dr Radio on the Nexus 7 without DX8 Transmitter

