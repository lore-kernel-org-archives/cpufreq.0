From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] If a CPU gets onlined set the governor to the one
	thatis run on other CPUs
Date: Mon, 27 Nov 2006 13:49:20 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454EBD5D7@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Dave Jones <davej@redhat.com>, Thomas Renninger <trenn@suse.de>
Cc: cpufreq@lists.linux.org.uk, Stefan Seyfried <seife@suse.de>, "Nakajima,
	Jun" <jun.nakajima@intel.com>

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Dave Jones
>Sent: Monday, November 27, 2006 9:33 AM
>To: Thomas Renninger
>Cc: cpufreq@lists.linux.org.uk; Stefan Seyfried
>Subject: Re: [PATCH] If a CPU gets onlined set the governor to=20
>the one thatis run on other CPUs
>
>On Mon, Nov 27, 2006 at 10:47:51AM +0100, Thomas Renninger wrote:
>
> > Thinking about x86 may get 16/32/64 CPU sockets the next=20
>years, it may
> > be convenient for very specific guys to run some nodes at highest
> > performance to even avoid some 2% performance regression on database
> > nodes while others are run with ondemand.
>
>For the HPC folks I've spoken with, this doesn't seem likely.
>If they care at all about that 2% (which they do), they'll want that
>out of every CPU, and not leave anything idle.
>(Typically I hear from the HPC folks "how do I turn this=20
>cpufreq thing off?")
>
>I'd rather we looked into merging conservative & ondemand, and have
>ondemand be tunable to not scale so frequently for such users.
>
>		Dave
>

Only usage model I can think of, where having per cpu governor is
helpful
is with virtualization.
Say Xen DOM 0 kernel does all the cpufreq enabling and each of the other
guests
asks for different governor, then DOM 0 can use per CPU governor and run
the guests with different governor requests.

Jun, who is looking at Power Management in Xen context, may have more
some
more thoughts on that.

Thanks,
Venki
