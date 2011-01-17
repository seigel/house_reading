require "rubygems"
require "serialport"
require "ring_buffer"

port_str = "/dev/tty.usbmodem3a21"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
average = RingBuffer.new 100
average.push 0
SerialPort.open(port_str, baud_rate, data_bits, stop_bits, parity) do |serial_port|
	while true do
	  line = serial_port.readline
	  continue if line.nil?
	  data = line.split(':')[1].strip.to_f
	  if (/.*Device 1.*/ =~ line) == 0
	    average.push data 
	    puts "#{line.chomp} overall avg: #{average.mean} (#{average.size} count buffer)"
    end
	end
end

