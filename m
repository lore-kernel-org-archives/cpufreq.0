From: Thomas Kisler <kay@rz.fh-augsburg.de>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Sat, 05 Aug 2006 23:12:30 +0200
Message-ID: <1154812350.26878.7.camel@sunmobile.home>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
	<a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
	<1154617007.23310.3.camel@skylla.slagter.name>
	<a11ccc30608030816s22bbd417pe93a00703d1f18df@mail.gmail.com>
	<1154633918.9169.15.camel@sunwork>
	<20060804085432.GN17014@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060804085432.GN17014@poupinou.org>
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
To: cpufreq@lists.linux.org.uk

On Fri, 2006-08-04 at 10:54 +0200, Bruno Ducrot wrote:
> On Thu, Aug 03, 2006 at 08:38:38PM +0100, kay@rz.fh-augsburg.de wrote:
> > Hi,
> > 
> > first, thanks for your answers.
> > 
> > Ok, I tried the throttling. And it's available two for the 191 MHz Mode.
> > And you are both right, there is no power saving if idle with the
> > throttling at both Modes.
> > Power Saving is about 200 mW at 191 MHz compared to 733 MHz. I know it's
> > not much, but I am not willing to accept that it's not possible :-).
> > Because it definitly is.
> > 
> 
> Maybe something is broken with power states of the processor.
> What say
> cat /proc/acpi/processor/*/power
> 
> Cheers,
> 
Hi,

/proc/acpi/processor/CPU0/power says (at 191Mhz in Battery Mode):

active state:            C1
max_cstate:              C8
bus master activity:     68118057
states:
   *C1:                  type[C1] promotion[C2] demotion[--]
latency[000] usage[00047422]
    C2:                  type[C2] promotion[C3] demotion[C1]
latency[084] usage[00154405]
    C3:                  type[C3] promotion[--] demotion[C2]
latency[120] usage[00043993]

With the AC-Adapter plugged and running at 1130 MHz the state changes
about every 5 secs. Maybe this is caused by the cpufreqd.

Greetz Thomas Kisler
