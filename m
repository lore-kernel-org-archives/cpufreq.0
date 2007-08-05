From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: do Pentium4 & PentiumM consume about the same at their lowest
	possible freq?
Date: Sun, 05 Aug 2007 11:49:47 -0700
Message-ID: <1186339787.17247.2.camel@laptopd505.fenrus.org>
References: <653FFBB4508B9042B5D43DC9E18836F50139486C@scsmsx415.amr.corp.intel.com>
	<46B394D5.4030509@unica.it>  <E1IH5jO-0002Yz-GW@uruk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <E1IH5jO-0002Yz-GW@uruk.org>
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
To: Erich Boleyn <erich@uruk.org>
Cc: cpufreq@lists.linux.org.uk

On Fri, 2007-08-03 at 15:34 -0700, Erich Boleyn wrote:

> Results of all this says that you get *less* than linear benefits from
> scaling frequency back or throttling alone.  Luckily, you can often
> reduce voltage when scaling back the frequency, and in that case it's
> really the voltage reduction which gives you most of the power savings.
> 
> 
> So, whenever possible use a freq/voltage scaling combination, which is
> what Enhanced Speedstep and Powernow have been doing for a while.

the situation is more complex than this though....

The CPU uses a LOT less power when idle. In practice on most cpus
(except when you overclock like crazy and go to high voltages) it's more
power efficient to go full speed to be idle as quickly as possible, so
that you get the power saving from idle.

This is especially the case for things like throttling; where you
basically keep the cpu just at a higher voltage for a longer time than
you would have otherwise...

-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org
