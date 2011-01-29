require "rubygems"
require "serialport"

port_str = "/dev/tty.usbmodem3a21"
baud_rate = 9600
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
serial_port = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
while true do
  line =  serial_port.readline
  unless (/Device 1/ =~ line).nil? 
    puts line
    File.open("temp.txt", 'w') {|f| f.write(line) }
  end

  #printf("%c", serial_port.getc)
end
serial_port.close
