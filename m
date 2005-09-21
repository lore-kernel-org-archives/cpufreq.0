From: bugme-daemon@kernel-bugs.osdl.org
Subject: [Bug 4781] Conservative governor makes me lose my USB keyboard
Date: Wed, 21 Sep 2005 00:10:51 -0700
Message-ID: <200509210710.j8L7Apde009009@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=4781





------- Additional Comments From koerner@in.tu-clausthal.de  2005-09-21 00:10 -------
Same on IBM Thinkpad R51:
echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
results in loose of the keyboard.

Linux satellite 2.6.13-gentoo-r2 #4 SMP Mon Sep 19 17:05:52 CEST 2005 i686 
Intel(R) Pentium(R) M processor 1700MHz GenuineIntel GNU/Linux

lspci:
0000:00:00.0 Host bridge: Intel Corporation 82855PM Processor to I/O Controller 
(rev 03)
0000:00:01.0 PCI bridge: Intel Corporation 82855PM Processor to AGP Controller 
(rev 03)
0000:00:1d.0 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/
ICH4-M) USB UHCI Controller #1 (rev 01)
0000:00:1d.1 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/
ICH4-M) USB UHCI Controller #2 (rev 01)
0000:00:1d.2 USB Controller: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/
ICH4-M) USB UHCI Controller #3 (rev 01)
0000:00:1d.7 USB Controller: Intel Corporation 82801DB/DBM (ICH4/ICH4-M) USB2 
EHCI Controller (rev 01)
0000:00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev 81)
0000:00:1f.0 ISA bridge: Intel Corporation 82801DBM (ICH4-M) LPC Interface 
Bridge (rev 01)
0000:00:1f.1 IDE interface: Intel Corporation 82801DBM (ICH4-M) IDE Controller 
(rev 01)
0000:00:1f.3 SMBus: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) SMBus 
Controller (rev 01)
0000:00:1f.5 Multimedia audio controller: Intel Corporation 82801DB/DBL/DBM 
(ICH4/ICH4-L/ICH4-M) AC'97 Audio Controller (rev 01)
0000:00:1f.6 Modem: Intel Corporation 82801DB/DBL/DBM (ICH4/ICH4-L/ICH4-M) AC'97 
Modem Controller (rev 01)
0000:01:00.0 VGA compatible controller: ATI Technologies Inc Radeon R250 Lf 
[FireGL 9000] (rev 02)
0000:02:00.0 CardBus bridge: Texas Instruments PCI4520 PC card Cardbus 
Controller (rev 01)
0000:02:00.2 FireWire (IEEE 1394): Texas Instruments: Unknown device 802a (rev 
01)
0000:02:01.0 Ethernet controller: Intel Corporation 82540EP Gigabit Ethernet 
Controller (Mobile) (rev 03)
0000:02:02.0 Network controller: Intel Corporation PRO/Wireless 2200BG (rev 05)



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
