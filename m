From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: hardware limits
Date: Sun, 4 Jun 2006 19:15:31 +0200
Message-ID: <20060604171531.GA25345@isilmar.linta.de>
References: <44795327.5000809@laposte.net>
	<20060529144727.GA10393@dominikbrodowski.de>
	<4481A0F4.5090702@laposte.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4481A0F4.5090702@laposte.net>
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
To: Niels Borne <niels.borne@laposte.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, Jun 03, 2006 at 04:47:16PM +0200, Niels Borne wrote:
> >On Sun, May 28, 2006 at 09:37:11AM +0200, Niels Borne wrote:
> >>I am working on a vaio laptop pcg-fr415b, using fc5 (see result of cat 
> >>/proc/cpuinfo above).
> >>Since it is quite noisy I allowed cpuspeed at startup and this improved 
> >>the situation a little bit.
> >>Still cpufreq-info (see details above -in french, but you can guess) gives
> >>hardware limits : 2.10 GHz - 2.80 GHz
> >>Is there any hope to go below 2.10 GHz and if yes, how ?
> >
> >Unfortunately no -- there's a bug in the hardware which causes problems if
> >the frequency is lower than 2 GHz. 
> 
> Which hardware exactly ? It this related to the N60 errata ?

Yes, that's the N60 errata.

> Also, p4-clockmod doesn't save you all
> >that much (if at all) 
> 
> well it seems to improve somewhat
> 
> as it doesn't do CPU frequency and voltage scaling,
> 
> what do you mean ? my frequency is now most often 2.10 GHz, and was 2.80 
> GHz, so it does CPU frequency, doesn't it ?

It doesn't scale the frequency, it throttles it -- and that means that the
voltage cannot be dropped:

"In contrast to CPU frequency scaling, where the operating frequency is
constantly modulated, throttling means the CPU is forced to a halt for short
periods of time. If throttled, the CPU [enters] into a physical and
electrical state comparable to the idling states mentioned above, so it can
be described as an enforced idling of the CPU.

As certain CPU power state typically utilize similar hardware
implementations, and as throttling does not have a positive effect on the
energy consumption during CPU power states, throttling the CPU by a given
rate is only useful if the CPU is less idle than the throttling rate."


	Dominik
