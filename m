From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Tue, 25 Jul 2006 16:47:47 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218EF5@SAUSEXMB1.amd.com>
References: <p73fyhdpqe1.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S964876AbWGYVr6@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <p73fyhdpqe1.fsf@verdi.suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ak@suse.de, "Gulam, Nagib" <nagib.gulam@amd.com>
Cc: discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

> > This patch provides a workaround by changing all processors to the 
> > same frequency at the same time, so that the TSC on each processor 
> > never increments at a different rate than the TSC on 
> > another processor.
>
> I'm still dubious if the result is really correct if the 
> hardware wasn't designed to guarantee synchronous TSC operation.
> 
> Can you do the following test please? 
> 
> - Set this option
> - Let the system run for let's say a day or two with some 
> freq transitions and varying loads [Better would be to let 
> two systems run in this way to compare]
> - Then hotunplug all the CPUs >0 with
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 0 > $i ; done
> - Wait a bit
> - Restart them again with
> for i in /sys/devices/system/cpu/cpu*/online ; do echo 1 > $i ; done

I started running a baseline test on Thursday, July 13th,
and continued until today.  The system was not running
cpufreq but it was using TSC as the sole gtod timesource.
Here's the numbers (again, after 12 days uptime):

SMP alternatives: switching to SMP code
Booting processor 1/4 APIC 0x1
Initializing CPU#1
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789204)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 1/1 -> Node 1
AMD Opteron(tm) Processor 854 stepping 01
CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff -132 cycles, maxerr 966
cycles)
SMP alternatives: switching to SMP code
Booting processor 2/4 APIC 0x2
Initializing CPU#2
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789200)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 2/2 -> Node 2
AMD Opteron(tm) Processor 838 stepping 01
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -132 cycles, maxerr 953
cycles)
SMP alternatives: switching to SMP code
Booting processor 3/4 APIC 0x3
Initializing CPU#3
Calibrating delay using timer specific routine.. 4394.58 BogoMIPS
(lpj=8789169)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 3/3 -> Node 3
AMD Opteron(tm) Processor 838 stepping 01
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -257 cycles, maxerr 864
cycles)

Compared to the same machine, immediately after reboot:
SMP alternatives: switching to SMP code
Booting processor 1/4 APIC 0x1
Initializing CPU#1
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789216)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 1/1 -> Node 1
AMD Opteron(tm) Processor 854 stepping 01
CPU 1: Syncing TSC to CPU 0.
CPU 1: synchronized TSC with CPU 0 (last diff -132 cycles, maxerr 972
cycles)
SMP alternatives: switching to SMP code
Booting processor 2/4 APIC 0x2
Initializing CPU#2
Calibrating delay using timer specific routine.. 4394.60 BogoMIPS
(lpj=8789212)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 2/2 -> Node 2
AMD Opteron(tm) Processor 838 stepping 01
CPU 2: Syncing TSC to CPU 0.
CPU 2: synchronized TSC with CPU 0 (last diff -129 cycles, maxerr 949
cycles)
SMP alternatives: switching to SMP code
Booting processor 3/4 APIC 0x3
Initializing CPU#3
Calibrating delay using timer specific routine.. 4394.57 BogoMIPS
(lpj=8789142)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 1024K (64 bytes/line)
CPU 3/3 -> Node 3
AMD Opteron(tm) Processor 838 stepping 01
CPU 3: Syncing TSC to CPU 0.
CPU 3: synchronized TSC with CPU 0 (last diff -173 cycles, maxerr 1648
cycles)

I don't see any significant drift.  It looks to me like 
current generation Opterons are TSC-safe.

Joachim was supposed to be collecting the data for the system
with PN! enabled, if he hasn't posted it already.

-Mark Langsdorf
AMD, Inc.

