
#!/usr/bin/env perl -w

use strict;
use Socket;

# 初始化地址与端口
my $host = shift || 'localhost';
my $port = shift || 7890;
my $server = "localhost";	# 主机地址

# 创建 socket 连接
socket(SOCKET, AF_INET, SOCK_STREAM, (getprotobyname('tcp'))[2]) or die("无法创建 socket $!\n");
# 连接服务端
connect(SOCKET, pack_sockaddr_in($port, inet_aton($server))) or die("无法连接: port $port $!\n");

my $line;
while ($line = <SOCKET>)
{
	print("$line\n");
}
close(SOCKET) or die("close failed: $!\n");
