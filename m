From: "Nakajima, Jun" <jun.nakajima@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates toACPIP-state
	driver
Date: Tue, 21 Oct 2003 14:22:44 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <7F740D512C7C1046AB53446D3720017304B038@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq@www.linux.org.uk, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, arjanv@redhat.com, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

> > It's about the frequency of the feedback loop. As we have much lower
> > latency with P-state transitions, the sampling time can be order of
> > millisecond (or shorter if meaningful). A userland daemon can have a
> > high-level policy (preferences, or set of parameters), but it cannot
be
> > part of the real feedback loop. If we combine P-state transitions
and
> > deeper C-state transitions, the situation is worse with a userland
> > daemon.
>=20
> You are making the assumption that a higher polling frequency (we'll
say
> 1ms) is in general better than a lower frequency (we'll say 1s).  I
submit
> that it is not.
>=20
> If I hit a key on my keyboard and your high frequency loop increases
CPU
> speed so that my word processor displays the letter 0.01s faster, is
that
> really beneficial?  If a window renders in 0.2s seconds instead of
0.3s is
> that a difference I am going to notice?
Then you can put the CPU in C-state or lower P-state after (or even
during) your word processor displays the letter. Even you can type very
fast, the CPU is almost idle. Having frequent feedbacks simply provide
more chances to save power consumption. Then aggregate saving would make
a difference. In addition, penalty of making a wrong decision is cheap.

>=20
> On the other hand, if I do a kernel compile and it is done 0.999s
faster
> with the higher frequency loop, am I going to miss that second over
such a
> long duration?  (In reality, the compile with the high-frequency loop
> would
> probably take longer unless it has near zero overhead).
Even if you build a kernel, there are many opportunities for the CPU to
save power consumption without causing visible performance regression.

>=20
> In my opinion it is wasteful to increase CPU speed unless there is a
> longer
> term need for it.
>=20
> > 	Jun
>=20
> Carl Thompson
>=20
