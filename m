From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Thu, 9 Sep 2004 00:01:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040908220139.GA8116@dominikbrodowski.de>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<loom.20040908T215751-536@post.gmane.org>
	<20040908213140.GA7842@dominikbrodowski.de>
	<loom.20040908T233809-28@post.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <loom.20040908T233809-28@post.gmane.org>
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
To: Stefan Tomanek <stefan@pico.ruhr.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Sep 08, 2004 at 09:43:03PM +0000, Stefan Tomanek wrote:
> Dominik Brodowski <linux <at> dominikbrodowski.de> writes:
> 
> > No. There is no way to determine which of four possible frequencies is the
> > valid one for a given Pentium M Dothan processor.
> 
> Hm, I'm new to this whole speedstepping thing, so I'm kind of confused: what
> exactly do you mean by "valid frequency"?

... it means that I need to get some sleep. I wanted to say "four possible
voltages" for each of the frequencies allowed.

> As I said, using ACPI I only get 600Mhz or 1500Mhz, all or nothing, with that
> patch I additionally have 800, 1000, 1200, and those levels work fine according
> to /proc/cpuinfo or the gkrellm cpu plugin.
However, you don't _know_ the proper voltages for 800, 1000, 1200 MHz.
Complain to your notebook vendor about this broken support, which most
likely is the same in other OSes.

	Dominik
