From: Alex Young <a.d.y@btinternet.com>
Subject: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Tue, 1 Jul 2003 01:44:37 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307010144.37902.a.d.y@btinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

I have a similar problem with the bios of my sony vaio fx802. It has a mobile 
athlonxp 1500+ and has the following output from powernow-k7.

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f74d0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 28 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:26 (@c00f76ac)
powernow:  cpuid: 0x780 fsb: 100        maxFID: 0x14    startvid: 0xe
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x8 (7.0x [700MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xc (9.0x [900MHz])   VID: 0xe (1.300V)
powernow:    FID: 0x0 (11.0x [1100MHz]) VID: 0xe (1.300V)
powernow:    FID: 0x14 (13.0x [1300MHz])        VID: 0xe (1.300V)
powernow: Minimum speed 500 MHz. Maximum speed 1300 MHz.

Now my (possibly stupid) question is:
Why are the frequency/voltage settings controlled by the bios?
Surely these values are the same for all processors of the same speed and 
stepping number. Would it not be possible to obtain the recommended values 
directly from AMD and use them instead of the ones provided by the bios. Or 
can the motherboard hardware only generate certain values? 

Incidently does anybody have a athlonxp 1500+ with a 'correct' PST table? If 
so does voltage scaling make any noticeable difference to temperature or 
battery life?
-- 
Alex Young
