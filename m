From: Dave Jones <davej@redhat.com>
Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 11:36:23 -0400
Message-ID: <20060920153623.GC30550@redhat.com>
References: <EB12A50964762B4D8111D55B764A84549CCDC8@scsmsx413.amr.corp.intel.com>
	<1158766475.25199.1.camel@sardonyx>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1158766475.25199.1.camel@sardonyx>
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
To: Bryan O'Sullivan <bos@serpentine.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, Sep 20, 2006 at 08:34:35AM -0700, Bryan O'Sullivan wrote:
 > On Wed, 2006-09-20 at 01:42 -0700, Pallipadi, Venkatesh wrote:
 > 
 > > There was a bug that got introduced in recent kernels and that was fixed
 > > with this patch here:
 > > http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=c
 > > ommit;h=a0cc621f52a4dea10c34eeed6eb4e36b26db63dc
 > > 
 > > Can you try this patch and recompile your kernel and see whether that
 > > helps?
 > 
 > I can try it, sure, but I'm not getting any error messages when I load
 > acpi-cpufreq, so it's not clear to me that I should expect this patch to
 > do anything.
 > 
 > Does the Pentium D 930 actually support frequency scaling?

You have 'est' in the flags, so yes.  speedstep-centrino might
possibly work too.

	Dave
