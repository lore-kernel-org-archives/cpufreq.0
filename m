From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 22:37:36 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021203736.GF26971@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<1066725533.5237.3.camel@laptop.fenrus.com>
	<20031021095925.GB893@inferi.kami.home>
	<20031021101737.GA31352@wiggy.net>
	<20031021105234.GF893@inferi.kami.home>
	<1066764198.5424d9a4ec004@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1066764198.5424d9a4ec004@carlthompson.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org, dongili@supereva.it

On Tue, Oct 21, 2003 at 12:23:18PM -0700, Carl Thompson wrote:
> > In other words: there is no valid way that a _user_ can set the policy
> > right now: the user can set the frequency, but since any sane policy
> > depends on how busy the CPU is, the user isn't even, the right person to
> > _do_ that, since the user doesn't _know_.
> 
> But userspace _can_ know the idle statistics for each CPU.  It's easily read
> from /proc/stat.

Well, /proc/stat, and kstat_cpu is very inaccurate. There's a project going
on to get better statistics for usage by cpufreq governors. And you really
don't want to export all sorts of statistics every, or every tenth timer 
tick to userspace. But if it's done in kernel-space, and if it's done right,
it may cost really few percentage points of performance.

Even though the governor proposed by Venkatesh may be done as well in
userspace [which I doubt], it's only one of several possible dynamic 
cpufreq governors, most of which will be much faster, leaner and meaner in
kernel space.

	Dominik
