From: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Subject: RE: Segmentation faults on AMD
Date: Wed, 13 Jun 2007 11:42:29 -0400
Message-ID: <863ADB2B1B757B45A27E4FCCD2DD370648C485@ex2k.bankofamerica.com>
References: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
	<1449F58C868D8D4E9C72945771150BDF02076E8F@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <1449F58C868D8D4E9C72945771150BDF02076E8F@SAUSEXMB1.amd.com>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>, cpufreq@lists.linux.org.uk

dmesg |grep power
powernow-k8: Found 8 AMD Athlon 64 / Opteron processors (version 1.60.0)
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
Kernel:
cat /proc/version 
Linux version 2.6.9-42.0.3.ELsmp
(brewbuilder@hs20-bc2-2.build.redhat.com) (gcc version 3.4.6 20060404
(Red Hat 3.4.6-3)) #1 SMP Mon Sep 25 17:24:31 EDT 2006

Dmesg |grep power :
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8
powernow-k8:    0 : fid 0x12 (2600 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x10 (2400 MHz), vid 0xa (1300 mV)
powernow-k8:    2 : fid 0xe (2200 MHz), vid 0xc (1250 mV)
powernow-k8:    3 : fid 0xc (2000 MHz), vid 0xe (1200 mV)
powernow-k8:    4 : fid 0xa (1800 MHz), vid 0x10 (1150 mV)
powernow-k8: cpu_init done, current fid 0x12, vid 0x8 


-Thanks
-----Original Message-----
From: Langsdorf, Mark [mailto:mark.langsdorf@amd.com] 
Sent: Wednesday, June 13, 2007 11:33 AM
To: Patel, Tushar; cpufreq@lists.linux.org.uk
Subject: RE: Segmentation faults on AMD

> I have followed all instructions to install this tool on :
> 1.) AMD Opteron(tm) Processor 252
> 2.) AMD Opteron (tm) Processor 885
> 
> I keep getting segmentation faults.
> 
> Can you please help?

What does `dmesg | grep power` return?  What kernel are you running?

-Mark Langsdorf
Operating System Research Center
AMD
