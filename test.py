import rfm
import time

rfm.init()

while True:
  print(rfm.poll())
  time.sleep(1)

