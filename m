From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: ondemand governor
Date: Fri, 24 Sep 2004 23:29:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040924212953.GA9502@dominikbrodowski.de>
References: <20040924142711.GE5746@message-id.gmane0305.slipkontur.de>
	<20040924201724.GA8299@dominikbrodowski.de>
	<20040924205301.GA16470@message-id.gmane0305.slipkontur.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040924205301.GA16470@message-id.gmane0305.slipkontur.de>
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
To: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Cc: cpufreq@www.linux.org.uk

On Fri, Sep 24, 2004 at 10:53:02PM +0200, Stefan Seyfried wrote:
> On Fri, Sep 24, 2004 at 10:17:24PM +0200, Dominik Brodowski wrote:
> > On Fri, Sep 24, 2004 at 04:27:13PM +0200, Stefan Seyfried wrote:
> > > i finally tried the ondemand governor. Short: i wasn't very impressed :-)
> > > I ran it on a Dell D600 with 1700mhz pentium M (banias)
> > 
> > Hm. What's the latency of the system? cat /proc/acpi/processor/*/performance
> > - or do you use the built-in tables?
> 
> to be honest - i have no idea. I don't have /proc/acpi/processor/*/performance
> It seems it is not compiled into SUSE kernels since it's marked 'deprecated'.
> dmesg doesn't show me much either, can i get this from sysfs?

Unfortunately, only indirectly. Modprobe cpufreq_ondemand and then 
cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
The latency can be deduced then.

Also, which driver do you use?

> also it may be a good idea to provide an option to consider "nice" processes
> as idle.
As an option, yes.

> Yes, that's what i had in mind. One "small, simple, fast" and one "fat and
> bloated with options" :-)

Excellent.

	Dominik
