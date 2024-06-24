# LITEbox (LED Instrument for Tomography Education in a box)

The LITEbox in the first instance is being produced for the Harwell Open Day on Saturday 29th June, which Diamond is a part of. This will see thousands of members of the public (upwards of 10,000 people) come to Diamond and learn about the science and engineering happening at our facility. As we will be in a run it will not be possible for them to visit beamlines. Therefore, the LITEbox is being built to still give them an understanding of what happens at beamlines and the importance of tomography at Diamond. 

Beyond Harwell Open Week, the LITEbox will be able to be used for various forms of engagement; from Diamond public open days, to outreach in schools. Making the LITEbox portable will therefore enable it to be used more at external events and opportunities and share the science that happens at Diamond far and wide. 

## Hardware

TODO: add system diagram and photos

The hardware consists of:

- [Thorlabs MCWHL7 Mounted LED](https://www.thorlabs.com/thorproduct.cfm?partnumber=MCWHL7)
- [Thorlabs LEDD1B LED Driver](https://www.thorlabs.com/thorproduct.cfm?partnumber=LEDD1B)
- [Thorlabs DDR25/M Rotation Mount](https://www.thorlabs.com/thorproduct.cfm?partnumber=DDR25/M)
- [Thorlabs KBD101 DC Servo Driver](https://www.thorlabs.com/thorproduct.cfm?partnumber=KBD101)
- [PandABox](https://quantumdetectors.com/products/pandabox/)

## Software

This repository contains the supporting files that are needed on the laptop that runs the experiment:

- The EPICS IOC for the GigE camera
- The settings for the PandA
- The script to run the experiment, starting the motor, controlling the IOC and reconstructing the data
