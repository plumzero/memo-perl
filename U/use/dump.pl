
#!/usr/bin/env perl -w

open(DATA, ">import.txt") or die "无法创建文件";
print DATA "hello\n";
print DATA "world\n";
close(DATA);

open(DATA, "<import.txt") or die "无法打开数据";
@lines = <DATA>;
print @lines;
close(DATA);

print("-" x 60 . "\n");

open(SRC, "<import.txt");
open(DST, ">output.txt");
while(<SRC>){
	print DST $_;
}
close(SRC);
close(DST);

my $file = "./import.txt";
my (@description, $size);
if (-e $file){
	push @description, '是一个二进制文件' if (-B _);
	push @description, '是一个socket(套接字)' if (-S _);
	push @description, '是一个文本文件' if (-T _);
	push @description, '是一个特殊块文件' if (-b _);
	push @description, '是一个特殊字符文件' if (-c _);
	push @description, '是一个目录' if (-d _);
	push @description, '文件存在' if (-x _);
	push @description, (($size = -s _)) ? "$size 字节" : "空";
	print "$file 信息:", join(', ', @description), "\n";
}
