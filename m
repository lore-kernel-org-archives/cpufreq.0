From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: celeron *clutches at straws*
Date: Thu, 6 Jan 2005 23:12:40 +0100
Message-ID: <20050106221240.GA8330@dominikbrodowski.de>
References: <3bd91160501051619632315d0@mail.gmail.com>
	<20050106161312.GC10011@dominikbrodowski.de>
	<3bd9116050106091631b1282d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3bd9116050106091631b1282d@mail.gmail.com>
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
To: Matthew East <matthew.east@gmail.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Jan 06, 2005 at 05:16:34PM +0000, Matthew East wrote:
> That is seriously useful thanks very much. I haven't looked in
> /proc/acpi/processor before! I have found that the C2 state is
> supported.
> 
> mdke@kallisto mdke $ cat /proc/acpi/processor/CPU0/power
> active state:            C2
> default state:           C1
> bus master activity:     00000000
> states:
>     C1:                  promotion[C2] demotion[--] latency[000]
> usage[07824590]   *C2:                  promotion[--] demotion[C1]
> latency[002] usage[134432919]
>     C3:                  <not supported>

Excellent. C3 would have been still better, though...

> Most useful of all will be your information on throttling, which i
> will experiment with. The last time I tried using throttling (through
> some kde gui on a mandrake live disk), it made some strange whining
> noises ;) Is it wholly safe? Noises make me uneasy...

Search for singing or bad capacitors, throttling, and/or high-pitched noise on 
the acpi and lkml lists, then you'll read many good posts on this :-)

	Dominik
