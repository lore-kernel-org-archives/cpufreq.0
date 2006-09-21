From: Ryan Underwood <nemesis@icequake.net>
Subject: Re: writing a cpufreq driver
Date: Thu, 21 Sep 2006 16:03:29 -0500
Message-ID: <20060921210329.GA16590@dbz.icequake.net>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060921193141.GE17065@redhat.com>
	<20060921200851.GF2364@dbz.icequake.net>
	<20060921204402.GA26683@redhat.com>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060921204402.GA26683@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Cpufreq@lists.linux.org.uk


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline


On Thu, Sep 21, 2006 at 04:44:02PM -0400, Dave Jones wrote:
>  > 
>  > No, because only the firmware knows what the real CPU speeds are.  How
>  > would I deal with this?
> 
> Actually, if your driver is correctly using cpufreq_notify_transition()
> it should be doing this automagically for you.  If you turn on debugging with
> cpufreq.debug=7 , you should see lines of the form.
> 
> scaling loops_per_jiffy to %lu for frequency %u kHz\n

I don't see this, here's the dmesg (2.6.16.28)

-- 
Ryan Underwood, <nemesis@icequake.net>

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename=dmesg

0000:00:04.0
  got res [18040000:18040fff] bus [18040000:18040fff] flags 200 for BAR 0 of 0000:00:02.0
PCI: moved device 0000:00:02.0 resource 0 (200) to 18040000
  got res [18041000:18041fff] bus [18041000:18041fff] flags 200 for BAR 0 of 0000:00:02.1
PCI: moved device 0000:00:02.1 resource 0 (200) to 18041000
PCI: Bus 1, cardbus bridge: 0000:00:02.0
  IO window: 00001000-000010ff
  IO window: 00001400-000014ff
  PREFETCH window: 10000000-11ffffff
  MEM window: 12000000-13ffffff
PCI: Bus 5, cardbus bridge: 0000:00:02.1
  IO window: 00001800-000018ff
  IO window: 00001c00-00001cff
  PREFETCH window: 14000000-15ffffff
  MEM window: 16000000-17ffffff
PCI: Enabling device 0000:00:02.0 (0004 -> 0007)
PCI: Setting latency timer of device 0000:00:02.0 to 64
PCI: Enabling device 0000:00:02.1 (0004 -> 0007)
PCI: Setting latency timer of device 0000:00:02.1 to 64
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
io scheduler noop registered
io scheduler deadline registered (default)
PCI: Calling quirk c01ce320 for 0000:00:00.0
PCI: Calling quirk c02052c9 for 0000:00:00.0
PCI: Calling quirk c01ce320 for 0000:00:02.0
PCI: Calling quirk c02052c9 for 0000:00:02.0
PCI: Calling quirk c01ce320 for 0000:00:02.1
PCI: Calling quirk c02052c9 for 0000:00:02.1
PCI: Calling quirk c01ce320 for 0000:00:04.0
PCI: Calling quirk c02052c9 for 0000:00:04.0
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
pnp: the driver 'i8042 kbd' has been registered
pnp: match found with the PnP device '00:07' and the driver 'i8042 kbd'
pnp: the driver 'i8042 aux' has been registered
pnp: match found with the PnP device '00:08' and the driver 'i8042 aux'
PNP: PS/2 Controller [PNP0303,PNP0f13] at 0x60,0x64 irq 1,12
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
pnp: the driver 'serial' has been registered
pnp: match found with the PnP device '00:0e' and the driver 'serial'
00:0e: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
pnp: match found with the PnP device '00:15' and the driver 'serial'
00:15: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Probing IDE interface ide0...
hda: FUJITSU MHH2048AT, ATA DISK drive
Probing IDE interface ide1...
hdc: TOSHIBA CD-ROM XM-1502BN, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 9514260 sectors (4871 MB) w/512KiB Cache, CHS=10068/15/63
hda: cache flushes not supported
 hda: hda1 hda2
EISA: Probing bus 0 at eisa.0
Cannot allocate resource for EISA slot 1
EISA: Detected 0 cards.
NET: Registered protocol family 2
input: AT Translated Set 2 keyboard as /class/input/input0
IP route cache hash table entries: 2048 (order: 1, 8192 bytes)
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP reno registered
TCP bic registered
Using IPI Shortcut mode
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 196k freed
Write protecting the kernel read-only data: 236k
NET: Registered protocol family 1
hdc: ATAPI 10X CD-ROM drive, 128kB Cache
Uniform CD-ROM driver Revision: 3.20
Floppy drive(s): fd0 is 1.44M
FDC 0 is an 8272A
input: PS/2 Generic Mouse as /class/input/input1
irda_init()
NET: Registered protocol family 23
Real Time Clock Driver v1.12ac
input: PC Speaker as /class/input/input2
pnp: the driver 'parport_pc' has been registered
pnp: match found with the PnP device '00:10' and the driver 'parport_pc'
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,ECP,DMA]
pnp: the driver 'cs4232-pnpbios' has been registered
pnp: match found with the PnP device '00:17' and the driver 'cs4232-pnpbios'
ALSA sound/isa/cs423x/cs4236.c:293: CS4232 WSS PnP manual resources are invalid, using auto config
CS4232 WSS PnP configure failed for WSS (out of resources?)
PnP BIOS detection failed for CS4232
pnp: Failed to disable device 00:17.
cs4232-pnpbios: probe of 00:17 failed with error -16
pnp: the driver 'cs4232_isapnp' has been registered
CS4232 soundcard not found or device busy
pnp: the driver 'cs4232_isapnp' has been unregistered
pnp: the driver 'cs4232-pnpbios' has been unregistered
Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
Yenta: ISA IRQ mask 0x0000, PCI irq 11
Socket status: 30000010
Yenta: CardBus bridge found at 0000:00:02.1 [0000:0000]
Yenta: ISA IRQ mask 0x0000, PCI irq 11
Socket status: 30000006
pccard: PCMCIA card inserted into slot 0
pnp: the driver 'cs4232-pnpbios' has been registered
pnp: match found with the PnP device '00:17' and the driver 'cs4232-pnpbios'
ALSA sound/isa/cs423x/cs4236.c:293: CS4232 WSS PnP manual resources are invalid, using auto config
CS4232 WSS PnP configure failed for WSS (out of resources?)
PnP BIOS detection failed for CS4232
pnp: Failed to disable device 00:17.
cs4232-pnpbios: probe of 00:17 failed with error -16
pnp: the driver 'cs4232_isapnp' has been registered
CS4232 soundcard not found or device busy
pnp: the driver 'cs4232_isapnp' has been unregistered
pnp: the driver 'cs4232-pnpbios' has been unregistered
ts: Compaq touchscreen protocol output
mice: PS/2 mouse device common for all mice
cs: IO port probe 0x100-0x4ff: excluding 0x120-0x127 0x220-0x22f 0x388-0x38f 0x480-0x48f 0x4d0-0x4d7
cs: IO port probe 0x800-0x8ff: clean.
cs: IO port probe 0xc00-0xcff: clean.
cs: IO port probe 0x1000-0x10ff: clean.
cs: IO port probe 0x1400-0x14ff: clean.
cs: IO port probe 0x1800-0x18ff: clean.
cs: IO port probe 0x100-0x4ff: excluding 0x120-0x127 0x220-0x22f 0x388-0x38f 0x480-0x48f 0x4d0-0x4d7
cs: IO port probe 0x800-0x8ff: clean.
cs: IO port probe 0xc00-0xcff: clean.
cs: IO port probe 0x1000-0x10ff: clean.
cs: IO port probe 0x1400-0x14ff: clean.
cs: IO port probe 0x1800-0x18ff: clean.
cs: IO port probe 0x1c00-0x1cff: clean.
cs: IO port probe 0x1c00-0x1cff: clean.
cs: memory probe 0xa0000000-0xa0ffffff: clean.
pcmcia: registering new device pcmcia0.0
pcmcia: registering new device pcmcia0.1
0.1: ttyS2 at I/O 0x3e8 (irq = 11) is a 16550A
eth0: NE2000 Compatible: io 0x300, irq 11, mem 0xca140000, auto xcvr, hw_addr 00:04:AC:84:59:C0
Adding 460204k swap on /dev/hda2.  Priority:-1 extents:1 across:460204k
EXT3 FS on hda1, internal journal
Toshiba System Managment Mode driver v1.11 26/9/2001
apm: BIOS version 1.2 Flags 0x02 (Driver version 1.16ac)
pnp: the driver 'cs4232-pnpbios' has been registered
pnp: match found with the PnP device '00:17' and the driver 'cs4232-pnpbios'
ALSA sound/isa/cs423x/cs4236.c:293: CS4232 WSS PnP manual resources are invalid, using auto config
CS4232 WSS PnP configure failed for WSS (out of resources?)
PnP BIOS detection failed for CS4232
pnp: Failed to disable device 00:17.
cs4232-pnpbios: probe of 00:17 failed with error -16
pnp: the driver 'cs4232_isapnp' has been registered
CS4232 soundcard not found or device busy
pnp: the driver 'cs4232_isapnp' has been unregistered
pnp: the driver 'cs4232-pnpbios' has been unregistered
register_blkdev: cannot get major 31 for mtdblock
Unable to register mtdblock block device on major 31: -16
slram: devname=ram_uncached, devstart=0x4000000, devlength=0x5000000
slram: ioremap failed
NET: Registered protocol family 17
openafs: module license 'http://www.openafs.org/dl/license10.html' taints kernel.
Found system call table at 0xc02624a0 (pattern scan)
Address 0xc02624a0 is not writable.
System call hooks will not be installed; proceeding anyway
Starting AFS cache scan...found 2532 non-empty cache files (25%).
NET: Registered protocol family 4
pccard: card ejected from slot 0
pccard: PCMCIA card inserted into slot 0
pcmcia: registering new device pcmcia0.0
eth0: NE2000 Compatible: io 0x300, irq 11, mem 0xca140000, auto xcvr, hw_addr 00:04:AC:84:59:C0
pcmcia: registering new device pcmcia0.1
0.1: ttyS2 at I/O 0x3e8 (irq = 11) is a 16550A
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
IPv6 over IPv4 tunneling driver
sit0: Disabled Privacy Extensions
eth0: no IPv6 routers present
toshiba_freq: Managing CPU (nominal 120 MHz), L2 cache, system fan
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing some ticks... checking if CPU frequency changed.
Losing too many ticks!
TSC cannot be used as a timesource.  
Possible reasons for this are:
  You're running with Speedstep,
  You don't have DMA enabled for your hard disk (see hdparm),
  Incorrect TSC synchronization on an SMP system (see dmesg).
Falling back to a sane timesource now.
Losing some ticks... checking if CPU frequency changed.
cpufreq-core: unregistering driver toshiba_freq
cpufreq-core: unregistering CPU 0
cpufreq-core: __cpufreq_governor for CPU 0, event 2
cpufreq-core: last reference is dropped
cpufreq-core: waiting for dropping of refcount
cpufreq-core: wait complete
freq-table: clearing show_table for cpu 0
toshiba_freq: Managing CPU (nominal 120 MHz), L2 cache, system fan
cpufreq-core: trying to register driver toshiba_freq
cpufreq-core: adding CPU 0
freq-table: table entry 0: 60000 kHz, 0 index
freq-table: table entry 1: 120000 kHz, 1 index
freq-table: setting show_table for cpu 0 to ca449908
cpufreq-core: setting new policy for CPU 0: 60000 - 120000 kHz
freq-table: request for verification of policy (60000 - 120000 kHz) for cpu 0
freq-table: verification lead to (60000 - 120000 kHz) for cpu 0
freq-table: request for verification of policy (60000 - 120000 kHz) for cpu 0
freq-table: verification lead to (60000 - 120000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 60000 - 120000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 1
performance: setting to 120000 kHz because of event 1
cpufreq-core: target for CPU 0: 120000 kHz, relation 1
freq-table: request for target 120000 kHz (relation: 1) for cpu 0
freq-table: target is 1 (120000 kHz, 1)
cpufreq-core: notification 0 of frequency transition to 120000 kHz
toshiba_freq: toshiba_freq: attempting to set frequency to 120000 kHz
toshiba_freq: toshiba_freq: SMM took 832684 cycles
cpufreq-core: notification 1 of frequency transition to 120000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
performance: setting to 120000 kHz because of event 3
cpufreq-core: target for CPU 0: 120000 kHz, relation 1
freq-table: request for target 120000 kHz (relation: 1) for cpu 0
freq-table: target is 1 (120000 kHz, 1)
cpufreq-core: notification 0 of frequency transition to 120000 kHz
toshiba_freq: toshiba_freq: attempting to set frequency to 120000 kHz
toshiba_freq: toshiba_freq: SMM took 778574 cycles
cpufreq-core: notification 1 of frequency transition to 120000 kHz
cpufreq-core: initialization complete
cpufreq-core: driver toshiba_freq up and running

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--fUYQa+Pmc3FrFX/N--

