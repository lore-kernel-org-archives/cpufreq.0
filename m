From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Thu, 23 Dec 2004 12:05:03 -0800
Message-ID: <1103832303.16431.60.camel@localhost>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
	<20041222203136.GB21861@redhat.com>
	<1103769532.16431.52.camel@localhost>
	<20041223182424.GA32326@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041223182424.GA32326@redhat.com>
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
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Thu, 2004-12-23 at 13:24 -0500, Dave Jones wrote:
> Usually takes a few. I've noticed if I run cpuspeed, it steps it down
> from 1.2GHz to 500MHz through a half dozen or so steps. Whilst it does
> this, its stable. If I then kill cpuspeed, its stable.
> But, if I leave cpuspeed run, and then do something CPU intensive, it
> tries to jump up to fullspeed quickly (through less steps than
> it took to scale down), when it does this, it hangs shortly afterwards.

Sebastian is reporting the problem with speedfreqd, which will use the
same number of steps both ways (and, depending on the CPU load curve, at
the same rate).

Does rate-limiting the transitions help stability?

> We're not doing voltage scaling in longhaul yet, but that shouldn't
> matter, as we should be booting at max voltage (as we boot at max speed)

Is voltage switching complex?  It might be worth trying - its not
something which normally improves stability, but maybe there's some
regulator issue under load changes, or something...

	J
