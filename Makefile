# Makefile
# Sample for raw example on Raspberry Pi
# Caution: requires bcm2835 library to be already installed
# http://www.airspayce.com/mikem/bcm2835/

CC       = g++-4.7
CFLAGS   = -std=c++11 -DFTDI_SPI -D__BASEFILE__=\"$*\"
CXXFLAGS = -Wall -O3 -g
LIBS     = -lftd2xx -lbcm2835
LMICBASE = ./
INCLUDE  = -I$(LMICBASE) 

all: lorarx

lora_rx.o: lora_rx.cpp
				$(CC) $(CFLAGS) -c lora_rx.cpp $(INCLUDE)

lora_tx.o: lora_tx.cpp
				$(CC) $(CFLAGS) -c lora_tx.cpp $(INCLUDE)

HopeDuino_LoRa.o: HopeDuino_LoRa.cpp
				$(CC) $(CFLAGS) -c HopeDuino_LoRa.cpp $(INCLUDE)

ftdispill.o: ftdispill.c
				$(CC) $(CFLAGS) -c ftdispill.c $(INCLUDE)

HopeFtdi_SPI.o: HopeFtdi_SPI.cpp
				$(CC) $(CFLAGS) -c HopeFtdi_SPI.cpp $(INCLUDE)

lorarx: lora_rx.o HopeDuino_LoRa.o ftdispill.o HopeFtdi_SPI.o
				$(CC) $^ $(LIBS) -o lorarx

loratx: loea_tc.o HopeDuino_LoRa.o ftdispill.o HopeFtdi_SPI.o 
				$(CC) $^ $(LIBS) -o loratx

clean:
				rm -rf *.o lorarx
