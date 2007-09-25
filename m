From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/1] Kernel compile bug in 2.6.22.6/7 {maybe more}
	ARM/StrongARM
Date: Tue, 25 Sep 2007 10:31:42 -0700
Message-ID: <20070925103142.c93719b3.akpm@linux-foundation.org>
References: <1E7A4807A136DF45AD33DB341D93C3BD1F0C19@msgswbmnmsp46.wellsfargo.com>
	<20070925073132.GA29127@flint.arm.linux.org.uk>
	<20070925143651.GA2769@redhat.com>
	<20070925095229.d1aec1a5.akpm@linux-foundation.org>
	<20070925165834.GE2769@redhat.com>
	<20070925100839.8d2e7b40.akpm@linux-foundation.org>
	<20070925172255.GL8127@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070925172255.GL8127@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, Greg.Chandler@wellsfargo.com, cpufreq@lists.linux.org.uk, Andi Kleen <ak@suse.de>, linux-kernel@vger.kernel.org, dan.j.williams@intel.com

On Tue, 25 Sep 2007 13:22:55 -0400 Dave Jones <davej@redhat.com> wrote:

>  > 
>  > OK, here: ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.21-rc5/2.6.21-rc5-mm3/broken-out/fix-x86_64-mm-sched-clock-share.patch
>  > 
>  > So I guess what we want to do here is to revert that patch, test i386
>  > allnoconfig and then fix up anything which breaks.
> 
> Nothing breaks for me with make ARCH=i386 bzImage on my x86-64 box
> (which should be the same as a native build).

Was that with allnoconfig?

> The functions that complain in that patch header don't seem to actually
> exist in mainline at all. (`init_sched_clock' and `call_r_s_f')
> Did this patch perhaps jump the gun, and these are -mm only ?

Could be that this patch fixed version 17 of sched-clock-share and we ended
up merging verion 56.  It was awful.
