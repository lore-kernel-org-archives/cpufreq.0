From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5934] New: System locks if cpufreq set to lowest level.
Date: Sat, 21 Jan 2006 13:16:33 -0800
Message-ID: <200601212116.k0LLGX9O014190@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5934

           Summary: System locks if cpufreq set to lowest level.
    Kernel Version: 2.6.16-rc1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: kernelbugs@loftwyr.ca


Most recent kernel where this bug did not occur: unknown
Distribution:  Gentoo
Hardware Environment: amd64
Problem Description:

I'm using the k8-powernow for powersaving on my X2-4200+ with cpufreq and
cpudyn.

When I start up, the k8-powernow statements are as follows:

powernow-k8: Found 2 AMD Athlon 64 / Opteron processors (version 1.50.4)
powernow-k8:    0 : fid 0xe (2200 MHz), vid 0x8 (1350 mV)
powernow-k8:    1 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)

This is confirmed by scaling_available_frequencies which echos
2200000 1000000

However, scaling_min_freq is 1452000 and that's what the powersave module
pushes down to.  if I force it to 1000000, my machine locks up.

The Gentoo devs told me to post it here after replicating it on the 2.6.16-rc1

Specs:
Motherboard: gigabyte GA-K8NF-9  BIOS F10 (latest)
Processor: Athlon 64 4200+

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
