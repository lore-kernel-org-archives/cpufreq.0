From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] New: Frequency Scaling not working properly using
	powernow-k7
Date: Sat, 24 Mar 2007 11:11:59 -0700
Message-ID: <200703241811.l2OIBxh9002804@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8255

           Summary: Frequency Scaling not working properly using powernow-k7
    Kernel Version: 2.6.19 and newer (up to 2.6.21-rc)
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: bugzilla.20.dsurawicz@spamgourmet.com


Most recent kernel where this bug did *NOT* occur: 2.6.18
Distribution: Gentoo Linux 2006.1
Hardware Environment: i686 mobile AMD Athlon(tm) XP 1500+ AuthenticAMD GNU/Linux
Problem Description: 

I've filed this bug already to Gentoo bugzilla
(http://bugs.gentoo.org/show_bug.cgi?id=164802) and they asked me to post it
here as well.

Here is a copy of the bug description:

----------------snip--------------------

After switching to the newly stabilized gentoo-sources-2.6.19-r5 kernel, my CPU
runs only on reduced speed:

solaris dustin # cd /sys/devices/system/cpu/cpu0/cpufreq/

solaris cpufreq # cat cpuinfo_max_freq 
1266768

solaris cpufreq # cat cpuinfo_cur_freq 
933408

solaris cpufreq # cat scaling_available_frequencies 
1266768 1000080 933408 800064 666720 

solaris cpufreq # cat scaling_available_governors   
ondemand powersave userspace performance 

solaris cpufreq # cat scaling_governor            
performance

solaris cpufreq # cat scaling_driver 
powernow-k7

solaris cpufreq # uname -a
Linux solaris 2.6.19-gentoo-r5 #1 Wed Jan 31 23:49:21 CET 2007 i686 mobile AMD
Athlon(tm) XP 1500+ AuthenticAMD GNU/Linux

Although in performance mode, the CPU is running not at max. frequency.
Switching to powersafe mode will reduce the frequency to minimum:

solaris cpufreq # echo powersave > scaling_governor 
solaris cpufreq # cat cpuinfo_cur_freq 
666720

With ondemand, frequency stays at minimum until CPU load increases, but never
exceeds 933408.

With CONFIG_CPU_FREQ unset CPU runs at max frequency.

----------------snap--------------------

After I received some help from Gentoo developers, I was able to find the
following lines in my dmesg.log, that seem to point to the problem:

----------------snip--------------------
powernow: Minimum speed 666 MHz. Maximum speed 1266 MHz.
freq-table: setting show_table for cpu 0 to cec867e0
freq-table: table entry 0: 1266768 kHz, 3085 index
freq-table: table entry 1: 1000080 kHz, 3593 index
freq-table: table entry 2: 933408 kHz, 3592 index
freq-table: table entry 3: 800064 kHz, 4358 index
freq-table: table entry 4: 666720 kHz, 4868 index
cpufreq-core: setting new policy for CPU 0: 666720 - 1266768 kHz
freq-table: request for verification of policy (666720 - 1266768 kHz) for cpu 0
freq-table: verification lead to (666720 - 1266768 kHz) for cpu 0
freq-table: request for verification of policy (666720 - 950000 kHz) for cpu 0
freq-table: verification lead to (666720 - 950000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 666720 - 950000 kHz

It seems that after detecting the correct max speed and setting the correct
policy, the max speed is reduced and again validated, which leads to an
incorrect max speed.
----------------snap--------------------

Steps to reproduce

1. Configure kernel to use frequency scaling with powernow-k7
2. Compile kernel and reboot using the new kernel
3. Check CPU frequency


I will attach the full log as well as my kernel config as well.

BR,
Dustin

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
