From: Dave Jones <davej@redhat.com>
Subject: Re: writing a cpufreq driver
Date: Thu, 21 Sep 2006 15:31:41 -0400
Message-ID: <20060921193141.GE17065@redhat.com>
References: <20060921184833.GC1216@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060921184833.GC1216@dbz.icequake.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nemesis@icequake.net
Cc: Cpufreq@lists.linux.org.uk

On Thu, Sep 21, 2006 at 01:48:33PM -0500, Ryan Underwood wrote:
 > 
 > I wrote a cpufreq target driver for older Toshiba laptops.  It uses SMM
 > to change between a "fast" and a "slow" processing speed.  I have two
 > remaining bugs.  Any comments would be appreciated.
 > 
 > 1.  The first time cpufreq changes speed, I get the whole "Losing some
 > ticks... checking if CPU frequency changed." then eventually "Losing too
 > many ticks!" and timer switches to PIT.  This does not happen when I use
 > the /dev/toshiba driver to change speeds from userspace.  Not sure what
 > is going on here...  SMI handler latency is between 6 and 7 ms.

Is loops_per_jiffy being correctly scaled on a speed transition?
Hmm, powernow-k7.c seems to be the only driver that's calling recalibrate_cpu_khz()

 > 2.  The current CPU frequency is stored in NVRAM by the SMI handler.

Wow, that's umm, crap :-}

 > Unfortunately, this means if cpufreq throttles the CPU and the system is
 > then rebooted, the boot process is exceedingly slow.  Is there some sane
 > way to hook into the shutdown process to restore the appropriate values,
 > or is this something I have to live with?

See register_reboot_notifier()

	Dave
