From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 18:46:16 +0200
Message-ID: <20071024164616.GY30533@stusta.de>
References: <20071024162312.GH30533@stusta.de>
	<20071024163245.GF32333@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071024163245.GF32333@flint.arm.linux.org.uk>
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
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: davej@codemonkey.org.uk, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Wed, Oct 24, 2007 at 05:32:45PM +0100, Russell King wrote:
> On Wed, Oct 24, 2007 at 06:23:12PM +0200, Adrian Bunk wrote:
> > cpufreq.c:cpufreq_get() no longer has any user.
> 
> Your checking seems to be flawed.
> 
> drivers/video/sa1100fb.c:               cpufreq_get(smp_processor_id()));
> drivers/video/sa1100fb.c:       pcd = get_pcd(var->pixclock, cpufreq_get(0));

Thanks for spotting this.

My mistake was that I thought this was handled by the following without 
checking closer:

arch/arm/mach-sa1100/generic.c:unsigned int cpufreq_get(unsigned int cpu)
arch/arm/mach-sa1100/generic.c:EXPORT_SYMBOL(cpufreq_get);

> Russell King

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
