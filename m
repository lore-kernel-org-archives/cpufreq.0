From: Alex Simonov <a_simonov@yahoo.com>
Subject: Broken PST for Sony Vaio FX-502 with Athlon XP 1900+ fixed !
Date: Mon, 29 Sep 2003 03:10:02 -0700 (PDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030929101002.13923.qmail@web20804.mail.yahoo.com>
References: <99F2150714F93F448942F9A9F112634C080EF0A6@txexmtae.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <99F2150714F93F448942F9A9F112634C080EF0A6@txexmtae.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hello guys,

Thanks to the all people, contributing to the
CPUFREQ project, finally I have powernow working
on my Vaio with upgraded Athlon 1900+ CPU! Thank
you guys, you're great!

This weekend I installed the 2.4.22-10mdk
Mandrake
kernel on my Linux system, and spent some time
tweaking the cpufreq driver. The problem was that
there was no suitable for my CPU PST table in the
BIOS. I modified a little bit the powernow-K7
module to hardwire the FID and VID values (not
forgetting to fix also the change_fid (VID) and
change_VID (FID) bug, which for some reason the
mandrake developers haven't fixed), and
guess what-I got the powernow working! Below is
the dmesg printout for the powernow module:

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can
scale: frequency and voltage.
powernow: Found PSB header at c00f74d0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 28 PST tables. (Only dumping ones
relevant to this CPU).
powernow: Sorry, no relevant to this CPU PST
found!
powernow: Trying to apply mobile Athlon XP 1900+
workaround..
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xd
(1.350V)
powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xd
(1.350V)
powernow:    FID: 0xa (8.0x [800MHz])   VID: 0xd
(1.350V)
powernow:    FID: 0xe (10.0x [1000MHz]) VID: 0xd
(1.350V)
powernow:    FID: 0x2 (12.0x [1200MHz]) VID: 0xd
(1.350V)
powernow:    FID: 0x16 (14.0x [1400MHz])       
VID: 0xd (1.350V)
powernow:    FID: 0x1a (16.0x [1600MHz])       
VID: 0xd (1.350V)

powernow: Minimum speed 500 MHz. Maximum speed
1600 MHz.

After the command echo -n "0%100%userspace" >
/proc/cpufreq I'm able to control manually the
speed petween 500 and 1600 MHz in seven steps,
using the /proc/sys/cpu/0/cpufreq interface. The
frequency change is confirmed also by x86info
utility.

This week I'll play a little bit with the VID
values of the "faked" PST table trying to see if
I  can scale down also the voltage-at the moment
I took the "safe" approach to use always the
nominal voltage.  

Thank you all once again,

Regards,

Alex


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
