require "rubygems"
require "serialport"
require 'prawn/core'
require 'prawn/graph'

port_str = "/dev/tty.usbmodem3a21"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
port_str = "/dev/tty.usbmodem3a21"
sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
data = [[0,0]]
count=1
while true do

	# value isn't afully formed thought
	value = sp.getc
	data << [count,value]
	count++
	printf("%c", value)
	Prawn::Document.generate('line_chart.pdf') do
		line_chart data, :at => [10, 10]
	end
end
sp.close
