# pip install pyserial
import asyncio
import time

import aioca
import serial

com = serial.Serial(
    port="/dev/ttyUSB0",
    baudrate=115200,
    bytesize=8,
    parity=serial.PARITY_NONE,
    stopbits=1,
    xonxoff=0,
    rtscts=0,
    timeout=1,
)


# https://github.com/Thorlabs/Motion_Control_Examples/blob/main/Python/KCube/KBD101/kbd101_triggering_serial.py
def send_command(command: str):
    data = bytearray.fromhex(command)
    com.write(data)
    com.flushInput()
    com.flushOutput()


def hex4(value: float) -> str:
    # 123456 -> 40E20100
    return int(value).to_bytes(4, "little").hex()


async def start_capture():
    await aioca.caput("BLEC1-EA-DET-01:HDF5:Capture", 1)


# https://www.thorlabs.com/Software/Motion%20Control/APT_Communications_Protocol_v38.pdf
# MGMSG_MOD_SET_CHANENABLESTATE
send_command("10 02 01 01 50 01")

try:
    # Scale factors from P39 for DDR25 stage
    VSCALE = 26843.5
    ASCALE = 2.74878
    velocity = 7.5  # degree/s
    accl = 1000  # degree/s/s

    # Calculate velocity and acceleration from
    # MGMSG_MOT_SET_VELPARAMS
    send_command(
        "13 04 0E 00 D0 01 "
        "01 00 " + "00 00 00 00 " + hex4(accl * ASCALE) + hex4(velocity * VSCALE)
    )

    # MGMSG_MOT_MOVE_VELOCITY
    send_command("57 04 01 01 50 01")

    time.sleep(1)
    # start the HDF5 capture
    asyncio.run(start_capture())

    time.sleep(60)
finally:
    # MGMSG_MOT_MOVE_STOP
    send_command("65 04 01 02 50 01")
