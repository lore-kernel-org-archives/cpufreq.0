From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Wed, 22 Dec 2004 18:38:52 -0800
Message-ID: <1103769532.16431.52.camel@localhost>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
	<20041222203136.GB21861@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041222203136.GB21861@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Sebastian <sebastian_ml@gmx.net>, cpufreq list <cpufreq@www.linux.org.uk>

On Wed, 2004-12-22 at 15:31 -0500, Dave Jones wrote:
> Yeah, longhaul is badly broken right now, and tbh, I've no idea
> what on earth is wrong. Speed transitions happen, and work correctly.
> Then a few minutes later, system locks up.
> 
> I've been trying all sorts of things, from disabling PCI mastering,
> disabling CPU caches, etc, but nothing seems to help. I'm truly puzzled.

I remember old versions of the C3 used to forget to snoop DMA traffic
while in the hlt instruction, so it wouldn't surprise me if there's some
other bug like that related to longhaul.  

Do you mean that it will crash some minutes after a single transition,
or is it less deterministic than that?  Do lots of transitions make it
worse?  Is the delay between transition and crash a random or
approximately fixed length, and does it depend on either core or bus
speed?

The reason I ask is that I have the ear of Via engineering support at
the moment (we're using embedded C3's in a product at work), so I could
ask a few well-placed questions.

	J
