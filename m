From: Bryan O'Sullivan <bos@serpentine.com>
Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 08:34:35 -0700
Message-ID: <1158766475.25199.1.camel@sardonyx>
References: <EB12A50964762B4D8111D55B764A84549CCDC8@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84549CCDC8@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

On Wed, 2006-09-20 at 01:42 -0700, Pallipadi, Venkatesh wrote:

> There was a bug that got introduced in recent kernels and that was fixed
> with this patch here:
> http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=c
> ommit;h=a0cc621f52a4dea10c34eeed6eb4e36b26db63dc
> 
> Can you try this patch and recompile your kernel and see whether that
> helps?

I can try it, sure, but I'm not getting any error messages when I load
acpi-cpufreq, so it's not clear to me that I should expect this patch to
do anything.

Does the Pentium D 930 actually support frequency scaling?

	<b
