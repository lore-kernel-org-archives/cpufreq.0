From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Sat, 7 Aug 2004 15:24:49 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040807132449.GA9569@dominikbrodowski.de>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040806175530.GA16167@dominikbrodowski.de>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>, Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Fri, Aug 06, 2004 at 07:55:30PM +0200, Dominik Brodowski wrote:
> On Fri, Aug 06, 2004 at 01:43:34PM -0400, Brian J. Murrell wrote:
> > printk("here we are in time_cpufreq_notifier 5\n");
> > 	write_sequnlock_irq(&xtime_lock);
> > printk("here we are in time_cpufreq_notifier 6\n");
> 
> So _this_ is where it fails... Davej, any idea?

Might it be that interrupts are still disabled during the RESUME
notification, and 

#define write_sequnlock_irq(lock)                                       \
        do { write_sequnlock(lock); local_irq_enable(); } while(0)

tries to enable them?

Thanks,
	Dominik
