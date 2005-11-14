From: yves piel <yvespiel@free.fr>
Subject: [VIA][C3] bad frequencies found
Date: Mon, 14 Nov 2005 22:26:22 +0100
Message-ID: <1132003582.7446.7.camel@linimi.narma.net>
Reply-To: yvespiel@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hello,

I have got a mini-itx C3 nehemoiah VIA mother board :
http://linitx.com/product_info.php?cPath=12_41&products_id=414

So I should can scale my cpu frequency between 533Mhz and 1.2Ghz. But,
when I load longhaul module, the available cpu frquencies are 800000 for
the min, and 180000 for the max.
How can I tell t the longhaul driver than mys cpu can scale down to
533Mhz and only up to 1.2Ghz ?

thank you :)

ps : here is what I do as root :
------------------------------------------------
linimi:/tmp# modprobe longhaul

linimi:/tmp# dmesg |tail
kjournald starting.  Commit interval 5 seconds
EXT3-fs warning: maximal mount count reached, running e2fsck is
recommended
EXT3 FS on sda9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
FAT: Filesystem panic (dev sda1)
    invalid access to FAT (entry 0x534c3436)
    File system has been set read-only
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.

linimi:/tmp# modprobe cpufreq_ondemand
linimi:/tmp# modprobe cpufreq_userspace

linimi:/tmp#cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
800000 1800000 900000 1100000 1200000 1400000 1600000 1000000 1300000
1500000 1700000 1800000
-------------------------------------------------
