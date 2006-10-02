From: Dave Jones <davej@redhat.com>
Subject: Re: TM1/TM2
Date: Mon, 2 Oct 2006 12:08:17 -0400
Message-ID: <20061002160817.GE23268@redhat.com>
References: <4520F84C.6090604@slagter.name>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4520F84C.6090604@slagter.name>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Mon, Oct 02, 2006 at 01:30:20PM +0200, Erik Slagter wrote:
 > Hi,
 > 
 > Is there a reliable way to know whether tm1/tm2 and/or other throttling
 > have been applied by the hardware?
 > 
 > I am very suspicious that my cpu does tm1 or tm2 once in a while, but I
 > can't prove it. It doesn't seem to be reported via MCE, which I'd expect.
 > 
 > FWIW I have a Pentium D915 and it has eist and tm1/tm2 (although linux
 > says only tm1), all enabled in the BIOS.

Thermal monitoring isn't actually handled by cpufreq, but by the mcheck code
(arch/i386/kernel/cpu/mcheck/p4.c)

It appears that if it is in use it does the following printk's..

    printk(KERN_EMERG "CPU%d: Temperature above threshold\n", cpu);
    printk(KERN_EMERG "CPU%d: Running in modulated clock mode\n",

So if you haven't seen those, it isn't in effect.

The only other thermal throttling is that provided by the p4-clockmod
module, which will scale regardless of temperature. If you don't want
it to scale, don't load the module ;)

	Dave

-- 
http://www.codemonkey.org.uk
