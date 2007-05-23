From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8524] New: Wrong cpu frequency displayed when overclocked
Date: Wed, 23 May 2007 04:04:21 -0700
Message-ID: <200705231104.l4NB4LwO008474@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8524

           Summary: Wrong cpu frequency displayed when overclocked
    Kernel Version: 2.6.21.1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: paapaa125@hotmail.com


Distribution: Gentoo (64-bit)
Hardware Environment: Core 2 Duo (E6400) + Asus P5B Deluxe

Problem Description:For some reason the CPU frequency is displayed incorrectly
if the processor is overclocked in BIOS and cpufreq is used.

1. If I disable "CPU Frequency Scaling" I get correct results from "cat
/proc/cpuinfo". It gives:

model name      : Intel(R) Core(TM)2 CPU   6400  @ 2.13GHz
stepping        : 6
cpu MHz         : 2960.004

As you can see, the processor is overclocked to 2,96GHz. This is correct.

2. If I enable "CPU Frequency Scaling" and use the default 'performance'
governor I get wrong results from "cat /proc/cpuinfo". It gives:

model name      : Intel(R) Core(TM)2 CPU   6400  @ 2.13GHz
stepping        : 6
cpu MHz         : 2128.000

Eventhough "cpu MHz" shows 2.13GHz my processor is still running at 2.96GHz -
this is verified by running some very CPU intensive calculations. Also the
program "cpufreq-info" gives this wrong frequency.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
