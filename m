From: Stefan Tomanek <stefan@pico.ruhr.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Wed, 8 Sep 2004 21:43:03 +0000 (UTC)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <loom.20040908T233809-28@post.gmane.org>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<loom.20040908T215751-536@post.gmane.org>
	<20040908213140.GA7842@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Dominik Brodowski <linux <at> dominikbrodowski.de> writes:

> No. There is no way to determine which of four possible frequencies is the
> valid one for a given Pentium M Dothan processor.

Hm, I'm new to this whole speedstepping thing, so I'm kind of confused: what
exactly do you mean by "valid frequency"?

As I said, using ACPI I only get 600Mhz or 1500Mhz, all or nothing, with that
patch I additionally have 800, 1000, 1200, and those levels work fine according
to /proc/cpuinfo or the gkrellm cpu plugin.

Thanks in advance for some enlightnment :-)
