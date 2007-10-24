From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [2.6 patch] #if 0 cpufreq.c:cpufreq_get()
Date: Wed, 24 Oct 2007 17:32:45 +0100
Message-ID: <20071024163245.GF32333@flint.arm.linux.org.uk>
References: <20071024162312.GH30533@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071024162312.GH30533@stusta.de>
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
To: Adrian Bunk <bunk@kernel.org>
Cc: davej@codemonkey.org.uk, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Wed, Oct 24, 2007 at 06:23:12PM +0200, Adrian Bunk wrote:
> cpufreq.c:cpufreq_get() no longer has any user.

Your checking seems to be flawed.

drivers/video/sa1100fb.c:               cpufreq_get(smp_processor_id()));
drivers/video/sa1100fb.c:       pcd = get_pcd(var->pixclock, cpufreq_get(0));

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
