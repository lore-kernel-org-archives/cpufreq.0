From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Which driver for Mobile P4 CPU?
Date: Thu, 6 Jan 2005 17:07:40 +0100
Message-ID: <20050106160740.GA10011@dominikbrodowski.de>
References: <20050105200721.21c6f5f8@bonenpikster.drs.p>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050105200721.21c6f5f8@bonenpikster.drs.p>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Dijkstra <newsuser@famdijkstra.org>
Cc: cpufreq@www.linux.org.uk

Hi,

On Wed, Jan 05, 2005 at 08:07:21PM +0100, Tim Dijkstra wrote:
> None of the drivers in the 2.6.10 kernel that have speedstep in their
> name are loadable. Does this mean that my CPU isn't supported or I'm a
> doing something wrong? 

Not really. the speedstep-smi is for older (P3) CPUs, speedstep-centrino for
Pentium Ms, and speedstep-ich only works if you have an Intel chipset in a
notebook, which I assume you don't have. So the acpi driver is the only one
left.

> Maybe I shouldn't be complaining, because with acpi-freq I'm able to
> switch between 1.2 and 2 GHz. I do however get kernel messages like:
> 
> kernel: acpi-cpufreq: Transition failed

All the time or just once in a while?

> Do the specific speedstep-* drivers have some extra features over (are
> 'better' than) the acpi-cpufreq driver or can just as well work with
> that?

The speedstep-* drivers tend to produce less "transition failed" results,
and at least for the speedstep-centrino case they also work faster.

	Dominik
