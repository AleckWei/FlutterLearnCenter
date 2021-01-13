import socket

# ip:port
ip_port = ('172.28.4.154', 8099)
# 最多可以连接的客户端的数量
back_log = 5
# 缓冲区大小
buffer_size = 1024

# 创建socket套接字
# 套接字类型：AF_INET
# socket.SOCK_STREAM tcp协议，基于流式协议传输方式
ser = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# 对socket的配置重用ip和端口号
ser.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# 绑定端口号
ser.bind(ip_port)
# 设置半连接池
ser.listen(back_log)

while True:
  print('接受启动')
  con, add = ser.accept()
  while True:
    try:
      msg = con.recv(buffer_size)
      print('收到的消息：', msg.decode('utf-8'))
      if msg.decode('utf-8') == '1':
          con.close()
          break
    except Exception as e:
        break

ser.close()
