From: Dave Jones <davej@redhat.com>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Thu, 23 Dec 2004 13:24:24 -0500
Message-ID: <20041223182424.GA32326@redhat.com>
References: <41C83AA7.6010204@gmx.net> <1103742159.16413.24.camel@localhost>
	<20041222203136.GB21861@redhat.com>
	<1103769532.16431.52.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1103769532.16431.52.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Wed, Dec 22, 2004 at 06:38:52PM -0800, Jeremy Fitzhardinge wrote:

 > > I've been trying all sorts of things, from disabling PCI mastering,
 > > disabling CPU caches, etc, but nothing seems to help. I'm truly puzzled.
 > 
 > I remember old versions of the C3 used to forget to snoop DMA traffic
 > while in the hlt instruction, so it wouldn't surprise me if there's some
 > other bug like that related to longhaul.  

That's why I was hoping disablign mastering would do the trick.

 > Do you mean that it will crash some minutes after a single transition,
 > or is it less deterministic than that?

Usually takes a few. I've noticed if I run cpuspeed, it steps it down
from 1.2GHz to 500MHz through a half dozen or so steps. Whilst it does
this, its stable. If I then kill cpuspeed, its stable.
But, if I leave cpuspeed run, and then do something CPU intensive, it
tries to jump up to fullspeed quickly (through less steps than
it took to scale down), when it does this, it hangs shortly afterwards.

We're not doing voltage scaling in longhaul yet, but that shouldn't
matter, as we should be booting at max voltage (as we boot at max speed)

 > The reason I ask is that I have the ear of Via engineering support at
 > the moment (we're using embedded C3's in a product at work), so I could
 > ask a few well-placed questions.
 
I speak with the centaur folks regularly, but they haven't got any
ideas what the problem could be either.

		Dave
