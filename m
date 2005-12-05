From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 5 Dec 2005 12:25:13 -0500
Message-ID: <20051205172513.GB12664@redhat.com>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com>
	<20051205130224.GC17993@harddisk-recovery.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051205130224.GC17993@harddisk-recovery.com>
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
Content-Transfer-Encoding: 7bit
To: Erik Mouw <erik@harddisk-recovery.com>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>, Lee Revell <rlrevell@joe-job.com>, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Dec 05, 2005 at 02:02:24PM +0100, Erik Mouw wrote:
 > On Sun, Dec 04, 2005 at 08:16:11PM -0500, Dave Jones wrote:
 > > I can't think of a single valid reason why a program would want
 > > to know the MHz rating of a CPU. Given that it's a) approximate,
 > > b) subject to change due to power management, c) completely nonsensical
 > > across CPU vendors, and d) only one of many variables regarding CPU
 > > performance, any program that bases any decision on the values found
 > > by parsing that field of /proc/cpuinfo is utterly broken beyond belief.
 > 
 > If you want a userspace governor to change the CPU speed, you need to
 > export the value to userland. 

We have sysfs files for that.

		Dave
