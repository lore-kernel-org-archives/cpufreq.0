From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: cpufreq on ARM - 2.6 problem
Date: Tue, 2 Sep 2003 23:28:17 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902232817.G9345@flint.arm.linux.org.uk>
References: <20030902182158.C9345@flint.arm.linux.org.uk>
	<20030902200451.GA4095@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902200451.GA4095@brodo.de>;
	from linux@brodo.de on Tue, Sep 02, 2003 at 10:04:51PM +0200
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk, mochel@osdl.org

On Tue, Sep 02, 2003 at 10:04:51PM +0200, Dominik Brodowski wrote:
> 2.)	frequency: B	frequency: A	-- the CPUfreq core and all
> 					   (external) drivers think[*] the
> 					   CPU frequency is equal to B, but
> 					   it is A. Because of this, the CPU
> 					   speed must be set AS SOON AS
> 					   POSSIBLE to B. But as all other
> 					   pieces of kernel code think it 
> 					   still equals "B", there is no
> 					   need to call notifiers. The
> 					   irqs_disabled() check in
> 					   cpufreq_notifiy_transition() is
> 					   triggered and blocks the call to
> 					   the notifiers.
> 
> So, [as long as you use the latest 2.6.0-test4 source] I doubt that it is 
> a hang in the cpufreq transition notifiers as they are never even called.

In which case, its probably this in cpu-sa1110.c:

        /*
         * The clock could be going away for some time.  Set the SDRAMs
         * to refresh rapidly (every 64 memory clock cycles).  To get
         * through the whole array, we need to wait 262144 mclk cycles.
         * We wait 20ms to be safe.
         */
        sdram_set_refresh(2);
        set_current_state(TASK_UNINTERRUPTIBLE);
        schedule_timeout(20 * HZ / 1000);

then.  I guess we need to case this with irqs_disabled() and use mdelay
instead.  Grr.

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
