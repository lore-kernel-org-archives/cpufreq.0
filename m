From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Tue, 1 Jul 2003 23:43:49 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030701234349.21ccec4f.frx@firenze.linux.it>
References: <200306301436.29188.lbelli@crema.unimi.it>
	<20030701005946.5e659273.frx@firenze.linux.it>
	<200307010120.19091.lbelli@crema.unimi.it>
Reply-To: cpufreq@www.linux.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200307010120.19091.lbelli@crema.unimi.it>
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

On Tue, 1 Jul 2003 01:20:18 +0200 Luigi Belli wrote:

> On Tuesday 01 July 2003 12:59 am, Francesco Poli wrote:
> 
> > Does anybody know a simple method to check if the BIOS is buggy or
> > not?
> 
> Well... simply look at syslog and see if the frequencies are
> correct... for my BIOS my cpu has 5 steps: 4 at 500Mhz and 1 at
> 600Mhz, all at 1,4V. That's obviously wrong...

Here's a /var/log/messages snippet:

AMD K7 CPU detected.
PowerNOW! Technology present. Can scale: frequency and voltage.
Found PSB header at c00e50e0
Table version: 0x12
Flags: 0x0 (Mobile voltage regulator)
Settling Time: 100 microseconds.
Has 1 PST tables. (Only dumping ones relevant to this CPU).
PST:0 (@c00e50f0)
 cpuid: 0x780^Ifsb: 100^ImaxFID: 0x16^Istartvid: 0xb
   FID: 0x4 (5.0x [500MHz])^IVID: 0x13 (1.200V)
   FID: 0x6 (6.0x [600MHz])^IVID: 0x13 (1.200V)
   FID: 0x8 (7.0x [700MHz])^IVID: 0x13 (1.200V)
   FID: 0xc (9.0x [900MHz])^IVID: 0x13 (1.200V)
   FID: 0xe (10.0x [1000MHz])^IVID: 0x11 (1.250V)
   FID: 0x0 (11.0x [1100MHz])^IVID: 0xe (1.300V)
   FID: 0x2 (12.0x [1200MHz])^IVID: 0xd (1.350V)
   FID: 0x16 (14.0x [1400MHz])^IVID: 0xb (1.450V)
Minimum speed 500 MHz. Maximum speed 1400 MHz.


The values look correct for an AMD Mobile Athlon XP 1600+, don't they?

BTW, a patch for the patch.
Well, actually, for its comments: you wrote Mhz somewhere and MHz
somewhere else. The right symbol is MHz, always!  ;-)


-- 
    Francesco Poli       <frx AT firenze.linux.it>
======================================================
You're compiling a program and, all of a sudden, boom!
  -- from APT HOWTO, version 1.8.0
