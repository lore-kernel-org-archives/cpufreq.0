From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6034] powernow-k8 fails to load on AMD Mobile Sempron 3000+
	system
Date: Sun, 12 Feb 2006 03:16:02 -0800
Message-ID: <200602121116.k1CBG2Lh031884@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6034

e_val@inbox.ru changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |CODE_FIX



------- Additional Comments From e_val@inbox.ru  2006-02-12 03:16 -------
Some updates on the story:

Yesterday I tried to find an updated BIOS for my laptop. As I've said before,
MaxSelect Mission A330 is based on Mitac MiNote 8889 (maybe 8889c or L, I don't
know for sure). It has several "brothers": Yakumo Q8M Turion64, Packard Bell B3
Series and Evesham Quest A210 T30. I have visited Mitac Service site
(www.mitacservice.com) along with sites of aforementioned manufacturers. The
only BIOS update I find was Revision 1.02 which is pretty old (my BIOS is 1.10).
I've contacted MaxSelect support but didn't receive a response yet.

So, finding new BIOS is not an easy task and I decided to have a closer look at
the bug. It was very interesting and fruitful. First, I've understood why I
thought powernow-k8 was working with earlier kernels. MaxSelect has an upgrade
service where you can change CPU, memory, etc on your notebook. Initially, my
laptop was equipped with Mobile Sempron 2600+ CPU, but I've upgraded it in
October (some weeks before 2.6.14 was released). That's why I thought Powernow
was working on earlier kernels - it was working on earlier CPUs! It is
understandable that my BIOS does not know anything about Sempron 3000+, which
was released in mid-summer 2005 (the BIOS itself is dated April 2005). As a
result, PSB entry filled by my BIOS was somewhat broken: it have NumPST == 0x33
instead of 0x01 (I think I'm not the first who observed this bug: there is
workaround for Sempron processors in powernow-k8.c, but it does not work for me)
and two P-states belonging to Mobile Sempron 2600+ (800MHz and 1600MHz).
Moreover, the number of P-states available on battery (equal to the number of
"usable P-states" in a driver) was only 1. I decided to make a small workaround
(not to say hack) and fill the PSB/PST entries with correct values (of course,
it's a BIOS job, but it's broken, as I've said earlier). The problem is, there
is no Power and Thermal Data sheet for Mobile Semprons on www.amd.com, so I had
to deduce fid/vid values. State 0 (lowest) was taken from AMD64 Power and
Thermal Data Sheet, while State 1 (highest) was set equal to the normal CPU
state (i.e. fid/vid when powernow-k8.ko is not loaded). I assume that my CPU has
only two P-states as 2600+ and other Semprons. Resulting PST entries are:

State 0: fid = 0x2 (1000 MHz) vid = 0x12 (1100 mV)
State 1: fid = 0xA (1800 MHz) vid = 0xA  (1300 mV)

Mr. Keck, if you could approve (or correct) these values, I would be very
grateful to you.

After making these changes driver was loaded successfully. I was able to change
CPU frequency through cpufreq sysfs interface and observe the changes both in
/proc/cpuinfo and sysfs. Hurray!

[Sorry for a long comment. I hope it will be useful for those who experience the
same problem as me and can't update BIOS for some reason]

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
