From: Dominik Brodowski <linux@brodo.de>
Subject: Re: cpufreq on ARM - 2.6 problem
Date: Tue, 2 Sep 2003 22:04:51 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902200451.GA4095@brodo.de>
References: <20030902182158.C9345@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030902182158.C9345@flint.arm.linux.org.uk>
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
To: cpufreq@www.linux.org.uk, mochel@osdl.org

On Tue, Sep 02, 2003 at 06:21:59PM +0100, Russell King wrote:
> Hi,
> 
> There seems to be a problem with cpufreq on SA11x0 platforms when resuming.
> The effect seems to be a hang.  I suspect that this is caused by the cpufreq
> resume method being a sys device (and therefore called with interrupts off).
> It sets the CPU clock rate, which in turn calls the transition notifier,
> which might (and does) sleep.
> 
> (of course, all this happens when the serial console is disabled because
> its a device not a sysdevice, so getting debug out of the system is nigh
> on impossible.)
> 
> I'm not sure what the right way to handle this is, and still ensure that
> all drivers have the right settings for stuff like SDRAM and LCD timings.

[cc'ed Pat for his knowledge of sysdevice handling and of the suspend/resume
process]

AFAICS, the following two things can occur:

	pre-suspend	early during resume
1.)	frequency: A	frequency: A	-- all notifiers, the CPUfreq core, 
					   all drivers think[*] the CPU
					   frequency equals A, it is A, so
					   we don't need to worry about anything.

2.)	frequency: B	frequency: A	-- the CPUfreq core and all
					   (external) drivers think[*] the
					   CPU frequency is equal to B, but
					   it is A. Because of this, the CPU
					   speed must be set AS SOON AS
					   POSSIBLE to B. But as all other
					   pieces of kernel code think it 
					   still equals "B", there is no
					   need to call notifiers. The
					   irqs_disabled() check in
					   cpufreq_notifiy_transition() is
					   triggered and blocks the call to
					   the notifiers.

So, [as long as you use the latest 2.6.0-test4 source] I doubt that it is 
a hang in the cpufreq transition notifiers as they are never even called.

	Dominik
