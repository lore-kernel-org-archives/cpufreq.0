From: Jonas Bechtel <post@jbechtel.de>
Subject: cpufreq-info SIGKILL or freeze unkillable in
 read(.../cpu0/cpufreq/stats/time_in_state)
Date: Mon, 24 May 2021 14:51:39 +0200
Message-ID: <20210524145139.5bbcf966@mmluhan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/DHKDSFwCl89tLoR45ui7s6R"
Return-path: <cpufreq-owner@vger.kernel.org>
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

--MP_/DHKDSFwCl89tLoR45ui7s6R
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline



Hi there,

here's some strange bug. Bug is reproducible:

BIOS: Set AMD overclocking configuration to Auto
Linux: /proc/cpuinfo and cpufreq-info show 1000 MHz on idle
Reboot
BIOS: Set AMD overclocking configuration to x7 (1400 MHz)
Linux: /proc/cpuinfo shows 1000 MHz on idle
Start Browser
Start cpufreq-info: output see attachment 01
	screen flickers 1x, one black block ~9x15px appears in upper left corner
cpu load ceases (browser loaded)
Start cpufreq-info: output see attachment 02
	screen flickers 1x, screen becomes normal again
	cpufreq-info is in an endless loop, unkillable
	strace on cpu-freq is unkillable, also
	Interaction with some programs become very slow (need to wait for file sys=
tem access?) but xterm with new bash prompt opens/closes in normal speed
	System cann't reboot but SysRq 'b' is working
Reboot
Start cpufreq-info: strace see attachment 03
	Same effects as 01
Start cpufreq-info: strace see attachment 04
	Same effects as 02, but after call 04 the black block keeps flickering


CPU AMD Athlon64 X2
Kernel 4.4.0, 64 bit
cpufreq-info 32 bit 008-1.1 (Debian)
Screen driver /usr/lib/xorg/modules/libfb.so for X 1.20.4
Kernel modules radeon and radeonfb loaded (Most probably radeon is active, =
radeonfb inactive)


All attachments (01, 02, 03, 04) are also copied in this message.

I hope this bug report is right in this list. I hope it helps. I don't need=
 a reply for my daily work (just leaving "overclocking" set to "Auto") but =
I want to leave the comment here that I have the impression that the Linux =
support of old hardware is ceasing (e.g. Irda, graphics) - some things are =
working with old kernels and don't anymore with newer kernels (drivers stil=
l present but don't fit to each other).

Best regards
 Jonas Bechtel



=3D=3D 01 =3D=3D
Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
  Treiber: powernow-k8
  Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
  Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 1
  Maximale Dauer eines Taktfrequenzwechsels: 109 us.
  Hardwarebedingte Grenzen der Taktfrequenz: 1000 MHz - 2.50 GHz
  m=C3=B6gliche Taktfrequenzen: 2.50 GHz, 2.40 GHz, 2.20 GHz, 2.00 GHz, 1.8=
0 GHz, 1000 MHz
  m=C3=B6gliche Regler: ondemand, performance
  momentane Taktik: die Frequenz soll innerhalb 1000 MHz und 2.50 GHz.
                    liegen. Der Regler "ondemand" kann frei entscheiden,
                    welche Taktfrequenz innerhalb dieser Grenze verwendet w=
ird.
  momentane Taktfrequenz ist 2.40 GHz.
Get=C3=B6tet

=3D=3D 02 =3D=3D
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
  Treiber: powernow-k8
  Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
  Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 1
  Maximale Dauer eines Taktfrequenzwechsels: 109 us.
  Hardwarebedingte Grenzen der Taktfrequenz: 1000 MHz - 2.50 GHz
  m=C3=B6gliche Taktfrequenzen: 2.50 GHz, 2.40 GHz, 2.20 GHz, 2.00 GHz, 1.8=
0 GHz, 1000 MHz
  m=C3=B6gliche Regler: ondemand, performance
  momentane Taktik: die Frequenz soll innerhalb 1000 MHz und 2.50 GHz.
                    liegen. Der Regler "ondemand" kann frei entscheiden,
                    welche Taktfrequenz innerhalb dieser Grenze verwendet w=
ird.
  momentane Taktfrequenz ist 1000 MHz.
[Hanging unkillable here]

=3D=3D 03 =3D=3D
execve("/usr/bin/cpufreq-info", ["cpufreq-info"], 0xfffd36c0 /* 36 vars */)=
 =3D 0
brk(NULL)                               =3D 0x565b7000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xf770f000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O=
_LARGEFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686/sse2", 0xffcc4ed0) =3D -1 ENOENT (Datei ode=
r Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/libcpufreq.so.0", O_RDONLY|O_LARG=
EFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Ver=
zeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARG=
EFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/sse2", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Ver=
zeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE=
|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Verzeich=
nis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LAR=
GEFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686/sse2", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Ve=
rzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFIL=
E|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Verzeic=
hnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFIL=
E|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/sse2", 0xffcc4ed0) =3D -1 ENOENT (Datei oder Verzeic=
hnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_C=
LOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib", {st_mode=3DS_IFDIR|0755, st_size=3D248, ...}) =3D 0
openat(AT_FDCWD, "tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CL=
OEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D=
 -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXE=
C) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 =
ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D220379, ...}) =3D 0
mmap2(NULL, 220379, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf76d9000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "/usr/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@#\0\0004\0\0\0"...=
, 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D26160, ...}) =3D 0
mmap2(NULL, 28884, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf76d10=
00
mmap2(0xf76d3000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENY=
WRITE, 3, 0x2000) =3D 0xf76d3000
mmap2(0xf76d5000, 8192, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, =
0x4000) =3D 0xf76d5000
mmap2(0xf76d7000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x5000) =3D 0xf76d7000
close(3)                                =3D 0
openat(AT_FDCWD, "[redacted]/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC)=
 =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D =
-1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D =
-1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 EN=
OENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D=
 -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 E=
NOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 E=
NOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 ENOENT=
 (Datei oder Verzeichnis nicht gefunden)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_LARGEFILE|O_CL=
OEXEC) =3D 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\254\1\0004\0\0=
\0"..., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1947056, ...}) =3D 0
mmap2(NULL, 1955712, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf74f=
3000
mprotect(0xf750c000, 1830912, PROT_NONE) =3D 0
mmap2(0xf750c000, 1368064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x19000) =3D 0xf750c000
mmap2(0xf765a000, 458752, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3=
, 0x167000) =3D 0xf765a000
mmap2(0xf76cb000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0x1d7000) =3D 0xf76cb000
mmap2(0xf76ce000, 10112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_AN=
ONYMOUS, -1, 0) =3D 0xf76ce000
close(3)                                =3D 0
set_thread_area({entry_number=3D-1, base_addr=3D0xf7710500, limit=3D0x0ffff=
f, seg_32bit=3D1, contents=3D0, read_exec_only=3D0, limit_in_pages=3D1, seg=
_not_present=3D0, useable=3D1}) =3D 0 (entry_number=3D12)
mprotect(0xf76cb000, 8192, PROT_READ)   =3D 0
mprotect(0xf76d7000, 4096, PROT_READ)   =3D 0
mprotect(0x565b5000, 4096, PROT_READ)   =3D 0
mprotect(0xf773c000, 4096, PROT_READ)   =3D 0
munmap(0xf76d9000, 220379)              =3D 0
brk(NULL)                               =3D 0x565b7000
brk(0x565d8000)                         =3D 0x565d8000
brk(0x565d9000)                         =3D 0x565d9000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE|O_C=
LOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D9814000, ...}) =3D 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf72f3000
mmap2(NULL, 2596864, PROT_READ, MAP_PRIVATE, 3, 0xb8000) =3D 0xf7079000
close(3)                                =3D 0
fstat64(1, {st_mode=3DS_IFCHR|0600, st_rdev=3Dmakedev(0x88, 0), ...}) =3D 0
write(1, "cpufrequtils 008: cpufreq-info ("..., 63) =3D 63
openat(AT_FDCWD, "/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D2995, ...}) =3D 0
read(3, "# Locale name alias data base.\n#"..., 4096) =3D 2995
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/share/locale/de/LC_MESSAGES/cpufrequtils.mo", O_RDON=
LY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D10540, ...}) =3D 0
mmap2(NULL, 10540, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf770c000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/gconv-modules.cache", O_RDO=
NLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D26400, ...}) =3D 0
mmap2(NULL, 26400, PROT_READ, MAP_SHARED, 3, 0) =3D 0xf7705000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/ISO8859-1.so", O_RDONLY|O_L=
ARGEFILE|O_CLOEXEC) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\20\0\0004\0\0\=
0"..., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D13736, ...}) =3D 0
mmap2(NULL, 16420, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf77000=
00
mmap2(0xf7701000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENY=
WRITE, 3, 0x1000) =3D 0xf7701000
mmap2(0xf7702000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, =
0x2000) =3D 0xf7702000
mmap2(0xf7703000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x2000) =3D 0xf7703000
close(3)                                =3D 0
mprotect(0xf7703000, 4096, PROT_READ)   =3D 0
write(1, "Bitte melden Sie Fehler an cpufr"..., 52) =3D 52
openat(AT_FDCWD, "/proc/stat", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
read(3, "cpu  1071 0 847 11936 5524 0 15 "..., 1024) =3D 1024
read(3, "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 "..., 1024) =3D 263
read(3, "", 1024)                       =3D 0
close(3)                                =3D 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=3DS_IFDIR|0755, st_size=3D=
0, ...}) =3D 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=3DS_IFDIR|0755, st_size=3D=
0, ...}) =3D 0
write(1, "analysiere CPU 0:\n", 18)     =3D 18
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", O=
_RDONLY) =3D -1 EACCES (Keine Berechtigung)
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver", O_R=
DONLY) =3D 3
read(3, "powernow-k8\n", 4095)          =3D 12
close(3)                                =3D 0
write(1, "  Treiber: powernow-k8\n", 23) =3D 23
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/related_cpus", O_RDO=
NLY) =3D 3
read(3, "0 1\n", 4095)                  =3D 4
close(3)                                =3D 0
write(1, "  Folgende CPUs laufen mit der g"..., 67) =3D 67
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus", O_RD=
ONLY) =3D 3
read(3, "0 1\n", 4095)                  =3D 4
close(3)                                =3D 0
write(1, "  Die Taktfrequenz folgender CPU"..., 71) =3D 71
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_l=
atency", O_RDONLY) =3D 3
read(3, "109000\n", 4095)               =3D 7
close(3)                                =3D 0
write(1, "  Maximale Dauer eines Taktfrequ"..., 53) =3D 53
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq", O=
_RDONLY) =3D 3
read(3, "2500000\n", 4095)              =3D 8
close(3)                                =3D 0
write(1, "  Hardwarebedingte Grenzen der T"..., 65) =3D 65
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_fr=
equencies", O_RDONLY) =3D 3
read(3, "2500000 2400000 2200000 2000000 "..., 4095) =3D 49
close(3)                                =3D 0
write(1, "  m\303\266gliche Taktfrequenzen: 2.50"..., 87) =3D 87
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_go=
vernors", O_RDONLY) =3D 3
read(3, "ondemand performance \n", 4095) =3D 22
close(3)                                =3D 0
write(1, "  m\303\266gliche Regler: ondemand, pe"..., 42) =3D 42
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", O=
_RDONLY) =3D 3
read(3, "ondemand\n", 4095)             =3D 9
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", O=
_RDONLY) =3D 3
read(3, "2500000\n", 4095)              =3D 8
close(3)                                =3D 0
write(1, "  momentane Taktik: die Frequenz"..., 71) =3D 71
write(1, "                    liegen. Der "..., 153) =3D 153
write(1, "  momentane Taktfrequenz ist 100"..., 39) =3D 39
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state"=
, O_RDONLY) =3D 3
read(3,  <unfinished ...>)              =3D ?
+++ killed by SIGKILL +++


=3D=3D 04 =3D=3D
execve("/usr/bin/cpufreq-info", ["cpufreq-info"], 0xffcc8e90 /* 36 vars */)=
 =3D 0
brk(NULL)                               =3D 0x5658c000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0xf771d000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O=
_LARGEFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686/sse2", 0xffda9ac0) =3D -1 ENOENT (Datei ode=
r Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/libcpufreq.so.0", O_RDONLY|O_LARG=
EFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686", 0xffda9ac0) =3D -1 ENOENT (Datei oder Ver=
zeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARG=
EFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/sse2", 0xffda9ac0) =3D -1 ENOENT (Datei oder Ver=
zeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE=
|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls", 0xffda9ac0) =3D -1 ENOENT (Datei oder Verzeich=
nis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LAR=
GEFILE|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686/sse2", 0xffda9ac0) =3D -1 ENOENT (Datei oder Ve=
rzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFIL=
E|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686", 0xffda9ac0) =3D -1 ENOENT (Datei oder Verzeic=
hnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFIL=
E|O_CLOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/sse2", 0xffda9ac0) =3D -1 ENOENT (Datei oder Verzeic=
hnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_C=
LOEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib", {st_mode=3DS_IFDIR|0755, st_size=3D248, ...}) =3D 0
openat(AT_FDCWD, "tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CL=
OEXEC) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D=
 -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXE=
C) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 =
ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D220379, ...}) =3D 0
mmap2(NULL, 220379, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf76e7000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "/usr/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@#\0\0004\0\0\0"...=
, 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D26160, ...}) =3D 0
mmap2(NULL, 28884, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf76df0=
00
mmap2(0xf76e1000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENY=
WRITE, 3, 0x2000) =3D 0xf76e1000
mmap2(0xf76e3000, 8192, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, =
0x4000) =3D 0xf76e3000
mmap2(0xf76e5000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x5000) =3D 0xf76e5000
close(3)                                =3D 0
openat(AT_FDCWD, "[redacted]/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC=
) =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC)=
 =3D -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D =
-1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D =
-1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 EN=
OENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D=
 -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 E=
NOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 E=
NOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =3D -1 ENOENT=
 (Datei oder Verzeichnis nicht gefunden)
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (Datei oder Verzeichn=
is nicht gefunden)
openat(AT_FDCWD, "/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_LARGEFILE|O_CL=
OEXEC) =3D 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\254\1\0004\0\0=
\0"..., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1947056, ...}) =3D 0
mmap2(NULL, 1955712, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf750=
1000
mprotect(0xf751a000, 1830912, PROT_NONE) =3D 0
mmap2(0xf751a000, 1368064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x19000) =3D 0xf751a000
mmap2(0xf7668000, 458752, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3=
, 0x167000) =3D 0xf7668000
mmap2(0xf76d9000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0x1d7000) =3D 0xf76d9000
mmap2(0xf76dc000, 10112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_AN=
ONYMOUS, -1, 0) =3D 0xf76dc000
close(3)                                =3D 0
set_thread_area({entry_number=3D-1, base_addr=3D0xf771e500, limit=3D0x0ffff=
f, seg_32bit=3D1, contents=3D0, read_exec_only=3D0, limit_in_pages=3D1, seg=
_not_present=3D0, useable=3D1}) =3D 0 (entry_number=3D12)
mprotect(0xf76d9000, 8192, PROT_READ)   =3D 0
mprotect(0xf76e5000, 4096, PROT_READ)   =3D 0
mprotect(0x5658a000, 4096, PROT_READ)   =3D 0
mprotect(0xf774a000, 4096, PROT_READ)   =3D 0
munmap(0xf76e7000, 220379)              =3D 0
brk(NULL)                               =3D 0x5658c000
brk(0x565ad000)                         =3D 0x565ad000
brk(0x565ae000)                         =3D 0x565ae000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE|O_C=
LOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D9814000, ...}) =3D 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf7301000
mmap2(NULL, 2596864, PROT_READ, MAP_PRIVATE, 3, 0xb8000) =3D 0xf7087000
close(3)                                =3D 0
fstat64(1, {st_mode=3DS_IFCHR|0600, st_rdev=3Dmakedev(0x88, 0), ...}) =3D 0
write(1, "cpufrequtils 008: cpufreq-info ("..., 63) =3D 63
openat(AT_FDCWD, "/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D2995, ...}) =3D 0
read(3, "# Locale name alias data base.\n#"..., 4096) =3D 2995
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/share/locale/de/LC_MESSAGES/cpufrequtils.mo", O_RDON=
LY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D10540, ...}) =3D 0
mmap2(NULL, 10540, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0xf771a000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/gconv-modules.cache", O_RDO=
NLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D26400, ...}) =3D 0
mmap2(NULL, 26400, PROT_READ, MAP_SHARED, 3, 0) =3D 0xf7713000
close(3)                                =3D 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/ISO8859-1.so", O_RDONLY|O_L=
ARGEFILE|O_CLOEXEC) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\20\0\0004\0\0\=
0"..., 512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D13736, ...}) =3D 0
mmap2(NULL, 16420, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0xf770e0=
00
mmap2(0xf770f000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENY=
WRITE, 3, 0x1000) =3D 0xf770f000
mmap2(0xf7710000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, =
0x2000) =3D 0xf7710000
mmap2(0xf7711000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DEN=
YWRITE, 3, 0x2000) =3D 0xf7711000
close(3)                                =3D 0
mprotect(0xf7711000, 4096, PROT_READ)   =3D 0
write(1, "Bitte melden Sie Fehler an cpufr"..., 52) =3D 52
openat(AT_FDCWD, "/proc/stat", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D 0
read(3, "cpu  1374 0 870 24647 5573 0 16 "..., 1024) =3D 1024
read(3, "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 "..., 1024) =3D 266
read(3, "", 1024)                       =3D 0
close(3)                                =3D 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=3DS_IFDIR|0755, st_size=3D=
0, ...}) =3D 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=3DS_IFDIR|0755, st_size=3D=
0, ...}) =3D 0
write(1, "analysiere CPU 0:\n", 18)     =3D 18
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", O=
_RDONLY) =3D -1 EACCES (Keine Berechtigung)
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver", O_R=
DONLY) =3D 3
read(3, "powernow-k8\n", 4095)          =3D 12
close(3)                                =3D 0
write(1, "  Treiber: powernow-k8\n", 23) =3D 23
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/related_cpus", O_RDO=
NLY) =3D 3
read(3, "0 1\n", 4095)                  =3D 4
close(3)                                =3D 0
write(1, "  Folgende CPUs laufen mit der g"..., 67) =3D 67
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus", O_RD=
ONLY) =3D 3
read(3, "0 1\n", 4095)                  =3D 4
close(3)                                =3D 0
write(1, "  Die Taktfrequenz folgender CPU"..., 71) =3D 71
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_l=
atency", O_RDONLY) =3D 3
read(3, "109000\n", 4095)               =3D 7
close(3)                                =3D 0
write(1, "  Maximale Dauer eines Taktfrequ"..., 53) =3D 53
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq", O=
_RDONLY) =3D 3
read(3, "2500000\n", 4095)              =3D 8
close(3)                                =3D 0
write(1, "  Hardwarebedingte Grenzen der T"..., 65) =3D 65
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_fr=
equencies", O_RDONLY) =3D 3
read(3, "2500000 2400000 2200000 2000000 "..., 4095) =3D 49
close(3)                                =3D 0
write(1, "  m\303\266gliche Taktfrequenzen: 2.50"..., 87) =3D 87
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_go=
vernors", O_RDONLY) =3D 3
read(3, "ondemand performance \n", 4095) =3D 22
close(3)                                =3D 0
write(1, "  m\303\266gliche Regler: ondemand, pe"..., 42) =3D 42
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", O=
_RDONLY) =3D 3
read(3, "ondemand\n", 4095)             =3D 9
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", O=
_RDONLY) =3D 3
read(3, "1000000\n", 4095)              =3D 8
close(3)                                =3D 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", O=
_RDONLY) =3D 3
read(3, "2500000\n", 4095)              =3D 8
close(3)                                =3D 0
write(1, "  momentane Taktik: die Frequenz"..., 71) =3D 71
write(1, "                    liegen. Der "..., 153) =3D 153
write(1, "  momentane Taktfrequenz ist 100"..., 39) =3D 39
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state"=
, O_RDONLY) =3D 3
read(3,=20







Bits & B=C3=A4ume Dresden, Tour de Natur, GR=C3=9CNE LIGA, Konglomerat e. V=
., ADFC, (ex-)tuuwi, Hochschulgruppe Rad, Institut f=C3=BCr Bahntechnik

Schlafende Projekte: CityConcierge, IKaRad, TerKur
Neueste Idee: Radfernbahn Berlin-Dresden, Dresden-Leipzig -> radfernbahn.de
& CityConcierge 4 Corona - http://jbechtel.de/site/sonstiges/covid19/CCfC/


--MP_/DHKDSFwCl89tLoR45ui7s6R
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=Bug_cpufreq-info--01_killed.txt

Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
  Treiber: powernow-k8
  Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
  Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 1
  Maximale Dauer eines Taktfrequenzwechsels: 109 us.
  Hardwarebedingte Grenzen der Taktfrequenz: 1000 MHz - 2.50 GHz
  m=C3=B6gliche Taktfrequenzen: 2.50 GHz, 2.40 GHz, 2.20 GHz, 2.00 GHz, 1.8=
0 GHz, 1000 MHz
  m=C3=B6gliche Regler: ondemand, performance
  momentane Taktik: die Frequenz soll innerhalb 1000 MHz und 2.50 GHz.
                    liegen. Der Regler "ondemand" kann frei entscheiden,
                    welche Taktfrequenz innerhalb dieser Grenze verwendet w=
ird.
  momentane Taktfrequenz ist 2.40 GHz.
Get=C3=B6tet

--MP_/DHKDSFwCl89tLoR45ui7s6R
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=Bug_cpufreq-info--02_hang.txt

cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Bitte melden Sie Fehler an cpufreq@vger.kernel.org.
analysiere CPU 0:
  Treiber: powernow-k8
  Folgende CPUs laufen mit der gleichen Hardware-Taktfrequenz: 0 1
  Die Taktfrequenz folgender CPUs werden per Software koordiniert: 0 1
  Maximale Dauer eines Taktfrequenzwechsels: 109 us.
  Hardwarebedingte Grenzen der Taktfrequenz: 1000 MHz - 2.50 GHz
  m=C3=B6gliche Taktfrequenzen: 2.50 GHz, 2.40 GHz, 2.20 GHz, 2.00 GHz, 1.8=
0 GHz, 1000 MHz
  m=C3=B6gliche Regler: ondemand, performance
  momentane Taktik: die Frequenz soll innerhalb 1000 MHz und 2.50 GHz.
                    liegen. Der Regler "ondemand" kann frei entscheiden,
                    welche Taktfrequenz innerhalb dieser Grenze verwendet w=
ird.
  momentane Taktfrequenz ist 1000 MHz.
[Hanging unkillable here]

--MP_/DHKDSFwCl89tLoR45ui7s6R
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=Bug_cpufreq-info--03_killed_strace_redacted.txt

execve("/usr/bin/cpufreq-info", ["cpufreq-info"], 0xfffd36c0 /* 36 vars */) = 0
brk(NULL)                               = 0x565b7000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf770f000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686/sse2", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/sse2", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686/sse2", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/sse2", 0xffcc4ed0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib", {st_mode=S_IFDIR|0755, st_size=248, ...}) = 0
openat(AT_FDCWD, "tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=220379, ...}) = 0
mmap2(NULL, 220379, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf76d9000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/usr/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@#\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=26160, ...}) = 0
mmap2(NULL, 28884, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf76d1000
mmap2(0xf76d3000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf76d3000
mmap2(0xf76d5000, 8192, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0xf76d5000
mmap2(0xf76d7000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5000) = 0xf76d7000
close(3)                                = 0
openat(AT_FDCWD, "[redacted]/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\254\1\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1947056, ...}) = 0
mmap2(NULL, 1955712, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf74f3000
mprotect(0xf750c000, 1830912, PROT_NONE) = 0
mmap2(0xf750c000, 1368064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19000) = 0xf750c000
mmap2(0xf765a000, 458752, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x167000) = 0xf765a000
mmap2(0xf76cb000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1d7000) = 0xf76cb000
mmap2(0xf76ce000, 10112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xf76ce000
close(3)                                = 0
set_thread_area({entry_number=-1, base_addr=0xf7710500, limit=0x0fffff, seg_32bit=1, contents=0, read_exec_only=0, limit_in_pages=1, seg_not_present=0, useable=1}) = 0 (entry_number=12)
mprotect(0xf76cb000, 8192, PROT_READ)   = 0
mprotect(0xf76d7000, 4096, PROT_READ)   = 0
mprotect(0x565b5000, 4096, PROT_READ)   = 0
mprotect(0xf773c000, 4096, PROT_READ)   = 0
munmap(0xf76d9000, 220379)              = 0
brk(NULL)                               = 0x565b7000
brk(0x565d8000)                         = 0x565d8000
brk(0x565d9000)                         = 0x565d9000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=9814000, ...}) = 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf72f3000
mmap2(NULL, 2596864, PROT_READ, MAP_PRIVATE, 3, 0xb8000) = 0xf7079000
close(3)                                = 0
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(0x88, 0), ...}) = 0
write(1, "cpufrequtils 008: cpufreq-info ("..., 63) = 63
openat(AT_FDCWD, "/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=2995, ...}) = 0
read(3, "# Locale name alias data base.\n#"..., 4096) = 2995
read(3, "", 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, "/usr/share/locale/de/LC_MESSAGES/cpufrequtils.mo", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=10540, ...}) = 0
mmap2(NULL, 10540, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf770c000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/gconv-modules.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=26400, ...}) = 0
mmap2(NULL, 26400, PROT_READ, MAP_SHARED, 3, 0) = 0xf7705000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/ISO8859-1.so", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\20\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=13736, ...}) = 0
mmap2(NULL, 16420, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf7700000
mmap2(0xf7701000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xf7701000
mmap2(0xf7702000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf7702000
mmap2(0xf7703000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf7703000
close(3)                                = 0
mprotect(0xf7703000, 4096, PROT_READ)   = 0
write(1, "Bitte melden Sie Fehler an cpufr"..., 52) = 52
openat(AT_FDCWD, "/proc/stat", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
read(3, "cpu  1071 0 847 11936 5524 0 15 "..., 1024) = 1024
read(3, "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 "..., 1024) = 263
read(3, "", 1024)                       = 0
close(3)                                = 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
write(1, "analysiere CPU 0:\n", 18)     = 18
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", O_RDONLY) = -1 EACCES (Keine Berechtigung)
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver", O_RDONLY) = 3
read(3, "powernow-k8\n", 4095)          = 12
close(3)                                = 0
write(1, "  Treiber: powernow-k8\n", 23) = 23
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/related_cpus", O_RDONLY) = 3
read(3, "0 1\n", 4095)                  = 4
close(3)                                = 0
write(1, "  Folgende CPUs laufen mit der g"..., 67) = 67
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus", O_RDONLY) = 3
read(3, "0 1\n", 4095)                  = 4
close(3)                                = 0
write(1, "  Die Taktfrequenz folgender CPU"..., 71) = 71
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_latency", O_RDONLY) = 3
read(3, "109000\n", 4095)               = 7
close(3)                                = 0
write(1, "  Maximale Dauer eines Taktfrequ"..., 53) = 53
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq", O_RDONLY) = 3
read(3, "2500000\n", 4095)              = 8
close(3)                                = 0
write(1, "  Hardwarebedingte Grenzen der T"..., 65) = 65
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies", O_RDONLY) = 3
read(3, "2500000 2400000 2200000 2000000 "..., 4095) = 49
close(3)                                = 0
write(1, "  m\303\266gliche Taktfrequenzen: 2.50"..., 87) = 87
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors", O_RDONLY) = 3
read(3, "ondemand performance \n", 4095) = 22
close(3)                                = 0
write(1, "  m\303\266gliche Regler: ondemand, pe"..., 42) = 42
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", O_RDONLY) = 3
read(3, "ondemand\n", 4095)             = 9
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", O_RDONLY) = 3
read(3, "2500000\n", 4095)              = 8
close(3)                                = 0
write(1, "  momentane Taktik: die Frequenz"..., 71) = 71
write(1, "                    liegen. Der "..., 153) = 153
write(1, "  momentane Taktfrequenz ist 100"..., 39) = 39
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state", O_RDONLY) = 3
read(3,  <unfinished ...>)              = ?
+++ killed by SIGKILL +++

--MP_/DHKDSFwCl89tLoR45ui7s6R
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=Bug_cpufreq-info--04_hang_strace_redacted.txt

execve("/usr/bin/cpufreq-info", ["cpufreq-info"], 0xffcc8e90 /* 36 vars */) = 0
brk(NULL)                               = 0x5658c000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xf771d000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686/sse2", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/i686", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls/sse2", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/tls", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686/sse2", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/i686", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib/sse2", 0xffda9ac0) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "[redacted]/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
stat64("[redacted]/lib", {st_mode=S_IFDIR|0755, st_size=248, ...}) = 0
openat(AT_FDCWD, "tls/i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=220379, ...}) = 0
mmap2(NULL, 220379, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf76e7000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/usr/lib/libcpufreq.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@#\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=26160, ...}) = 0
mmap2(NULL, 28884, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf76df000
mmap2(0xf76e1000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf76e1000
mmap2(0xf76e3000, 8192, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0xf76e3000
mmap2(0xf76e5000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5000) = 0xf76e5000
close(3)                                = 0
openat(AT_FDCWD, "[redacted]/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "tls/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "i686/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "sse2/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (Datei oder Verzeichnis nicht gefunden)
openat(AT_FDCWD, "/lib/i386-linux-gnu/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\3\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\254\1\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1947056, ...}) = 0
mmap2(NULL, 1955712, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf7501000
mprotect(0xf751a000, 1830912, PROT_NONE) = 0
mmap2(0xf751a000, 1368064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19000) = 0xf751a000
mmap2(0xf7668000, 458752, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x167000) = 0xf7668000
mmap2(0xf76d9000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1d7000) = 0xf76d9000
mmap2(0xf76dc000, 10112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xf76dc000
close(3)                                = 0
set_thread_area({entry_number=-1, base_addr=0xf771e500, limit=0x0fffff, seg_32bit=1, contents=0, read_exec_only=0, limit_in_pages=1, seg_not_present=0, useable=1}) = 0 (entry_number=12)
mprotect(0xf76d9000, 8192, PROT_READ)   = 0
mprotect(0xf76e5000, 4096, PROT_READ)   = 0
mprotect(0x5658a000, 4096, PROT_READ)   = 0
mprotect(0xf774a000, 4096, PROT_READ)   = 0
munmap(0xf76e7000, 220379)              = 0
brk(NULL)                               = 0x5658c000
brk(0x565ad000)                         = 0x565ad000
brk(0x565ae000)                         = 0x565ae000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=9814000, ...}) = 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf7301000
mmap2(NULL, 2596864, PROT_READ, MAP_PRIVATE, 3, 0xb8000) = 0xf7087000
close(3)                                = 0
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(0x88, 0), ...}) = 0
write(1, "cpufrequtils 008: cpufreq-info ("..., 63) = 63
openat(AT_FDCWD, "/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=2995, ...}) = 0
read(3, "# Locale name alias data base.\n#"..., 4096) = 2995
read(3, "", 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, "/usr/share/locale/de/LC_MESSAGES/cpufrequtils.mo", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=10540, ...}) = 0
mmap2(NULL, 10540, PROT_READ, MAP_PRIVATE, 3, 0) = 0xf771a000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/gconv-modules.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=26400, ...}) = 0
mmap2(NULL, 26400, PROT_READ, MAP_SHARED, 3, 0) = 0xf7713000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/i386-linux-gnu/gconv/ISO8859-1.so", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\20\0\0004\0\0\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=13736, ...}) = 0
mmap2(NULL, 16420, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xf770e000
mmap2(0xf770f000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xf770f000
mmap2(0xf7710000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf7710000
mmap2(0xf7711000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xf7711000
close(3)                                = 0
mprotect(0xf7711000, 4096, PROT_READ)   = 0
write(1, "Bitte melden Sie Fehler an cpufr"..., 52) = 52
openat(AT_FDCWD, "/proc/stat", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
read(3, "cpu  1374 0 870 24647 5573 0 16 "..., 1024) = 1024
read(3, "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 "..., 1024) = 266
read(3, "", 1024)                       = 0
close(3)                                = 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
stat64("/sys/devices/system/cpu/cpu0/", {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
write(1, "analysiere CPU 0:\n", 18)     = 18
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", O_RDONLY) = -1 EACCES (Keine Berechtigung)
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver", O_RDONLY) = 3
read(3, "powernow-k8\n", 4095)          = 12
close(3)                                = 0
write(1, "  Treiber: powernow-k8\n", 23) = 23
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/related_cpus", O_RDONLY) = 3
read(3, "0 1\n", 4095)                  = 4
close(3)                                = 0
write(1, "  Folgende CPUs laufen mit der g"..., 67) = 67
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/affected_cpus", O_RDONLY) = 3
read(3, "0 1\n", 4095)                  = 4
close(3)                                = 0
write(1, "  Die Taktfrequenz folgender CPU"..., 71) = 71
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_transition_latency", O_RDONLY) = 3
read(3, "109000\n", 4095)               = 7
close(3)                                = 0
write(1, "  Maximale Dauer eines Taktfrequ"..., 53) = 53
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq", O_RDONLY) = 3
read(3, "2500000\n", 4095)              = 8
close(3)                                = 0
write(1, "  Hardwarebedingte Grenzen der T"..., 65) = 65
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies", O_RDONLY) = 3
read(3, "2500000 2400000 2200000 2000000 "..., 4095) = 49
close(3)                                = 0
write(1, "  m\303\266gliche Taktfrequenzen: 2.50"..., 87) = 87
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors", O_RDONLY) = 3
read(3, "ondemand performance \n", 4095) = 22
close(3)                                = 0
write(1, "  m\303\266gliche Regler: ondemand, pe"..., 42) = 42
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor", O_RDONLY) = 3
read(3, "ondemand\n", 4095)             = 9
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq", O_RDONLY) = 3
read(3, "1000000\n", 4095)              = 8
close(3)                                = 0
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq", O_RDONLY) = 3
read(3, "2500000\n", 4095)              = 8
close(3)                                = 0
write(1, "  momentane Taktik: die Frequenz"..., 71) = 71
write(1, "                    liegen. Der "..., 153) = 153
write(1, "  momentane Taktfrequenz ist 100"..., 39) = 39
openat(AT_FDCWD, "/sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state", O_RDONLY) = 3
read(3, 
--MP_/DHKDSFwCl89tLoR45ui7s6R--
