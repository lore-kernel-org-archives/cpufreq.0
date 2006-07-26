From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Wed, 26 Jul 2006 11:42:02 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218F04@SAUSEXMB1.amd.com>
References: <p73fyhdpqe1.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751686AbWGZQmT@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <p73fyhdpqe1.fsf@verdi.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ak@suse.de, "Gulam, Nagib" <nagib.gulam@amd.com>
Cc: discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> - Set this option
> - Let the system run for let's say a day or two with some 
> freq transitions and varying loads [Better would be to let 
> two systems run in this way to compare]
> - Then hotunplug all the CPUs >0 with
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 0 > $i ; done
> - Wait a bit
> - Restart them again with
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 1 > $i ; done
> 
> The kernel should now print the results of the TSC resync for 
> the replugged CPUs with output like this
> 
> CPU N: Syncing TSC to CPU 0.
> CPU N: synchronized TSC with CPU 0 (last diff XXX cycles, 
> maxerr YYY cycles)
> 
> How do these numbers look like, also compared to the original 
> boot output?
> 
> If the cycles diverge more between the different CPUs it 
> would be a bad sign. 
> It would mean that the error would add up over longer runtime 
> and timing would get more and more unstable.

Andi -

Are you sure this test is testing what you think it is testing?
I just ran my system with the stock 2.6.18 kernel and TSC enabled.
I ran PN! on a varying load long enough for the clocks to become
completely unglued.  The time delta on the command `date;sleep 5;
date` was going from -10 to 30 seconds.  However, the results
of your test show no problems:

during bootup
SMP alternatives: switching to SMP code
Booting processor 1/4 APIC 0x1
Initializing CPU#1
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789206)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 1/1 -> Node 1
AMD Opteron(tm) Processor 854 stepping 01
CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff -135 cycles, maxerr 968
cycles)
SMP alternatives: switching to SMP code
Booting processor 2/4 APIC 0x2
Initializing CPU#2
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789208)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 2/2 -> Node 2
AMD Opteron(tm) Processor 838 stepping 01
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -132 cycles, maxerr 949
cycles)
SMP alternatives: switching to SMP code
Booting processor 3/4 APIC 0x3
Initializing CPU#3
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789214)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 3/3 -> Node 3
AMD Opteron(tm) Processor 838 stepping 01
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -184 cycles, maxerr 1648
cycles)
Brought up 4 CPUs

hot add of offlined CPUs
Booting processor 1/4 APIC 0x1
Initializing CPU#1
Calibrating delay using timer specific routine.. 1997.56 BogoMIPS
(lpj=3995129)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 1/1 -> Node 1
AMD Opteron(tm) Processor 854 stepping 01
CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff -102 cycles, maxerr 685
cycles)
powernow-k8:    0 : fid 0xe (2200 MHz), vid 0xc
powernow-k8:    1 : fid 0xc (2000 MHz), vid 0xe
powernow-k8:    2 : fid 0xa (1800 MHz), vid 0x10
powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12
SMP alternatives: switching to SMP code
Booting processor 2/4 APIC 0x2
Initializing CPU#2
Calibrating delay using timer specific routine.. 1997.54 BogoMIPS
(lpj=3995084)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 2/2 -> Node 2
AMD Opteron(tm) Processor 838 stepping 01
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -97 cycles, maxerr 663
cycles)
powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x6
powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x8
powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa
powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12
SMP alternatives: switching to SMP code
Booting processor 3/4 APIC 0x3
Initializing CPU#3
Calibrating delay using timer specific routine.. 1997.54 BogoMIPS
(lpj=3995099)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 3/3 -> Node 3
AMD Opteron(tm) Processor 838 stepping 01
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -109 cycles, maxerr 1024
cycles)
powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x6
powernow-k8:    1 : fid 0xc (2000 MHz), vid 0x8
powernow-k8:    2 : fid 0xa (1800 MHz), vid 0xa
powernow-k8:    3 : fid 0x2 (1000 MHz), vid 0x12

Is there a better test we can be using?

-Mark Langsdorf
AMD, Inc.

