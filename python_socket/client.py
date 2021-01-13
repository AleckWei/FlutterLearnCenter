import socket

ip_port = ('172.28.4.154', 8099)

p = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
p.connect(ip_port)

while True:
    msg = input('请输入：')
    if not msg:
        continue
    p.send(msg.encode('utf-8'))
    if msg == '1':
        break

p.close
