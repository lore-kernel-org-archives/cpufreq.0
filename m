From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] support for CPUFREQ_ETERNAL drivers by the ondemand
	governor
Date: Mon, 7 Feb 2005 10:29:01 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003F34443@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Eric Piel <Eric.Piel@tremplin-utc.net>, "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: cpufreq@ZenII.linux.org.uk


Hi,

The ondemand governor uses the transitions latency information=20
to set a proper default sampling rate.=20
For example, if the transitions latency is 100uS, the default=20
sampling rate used by ondemand governor is 100 mS. So, wrong=20
assumption about the transition latency can lead to frequent=20
sampling and overhead in the kernel. Transition Latency doesn't=20
matter a lot for userspace governors as their sampling rate is=20
typically much less (few seconds).

I agree that changing CPUFREQ_ETERNAL to 10mS would be safe with=20
most of the governors and this change would enable such governors=20
to work with ondemand. But, making this assumption inside=20
the ondemand governor makes me little nervous. What if some=20
particular driver has latency more than 10mS (there may not be=20
any such driver today. But, some new driver can come up in future).=20

I feel better way to workarond this issue is to have one more=20
intermediate #define, say CPUFREQ_LATENCY_LESS_THAN_1MS defined=20
to 1MS and use it in place of CPUFREQ_ETERNAL in all the drivers=20
that know their transition latency is less than this value and =20
don't know their exact transition latency.

Thanks,
Venki

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Sunday, February 06, 2005 2:34 PM
>To: Pallipadi, Venkatesh; Nakajima, Jun
>Cc: cpufreq@ZenII.linux.org.uk
>Subject: [PATCH] support for CPUFREQ_ETERNAL drivers by the=20
>ondemand governor
>
>Hello,
>
>For now the ondemand governor doesn't support the drivers=20
>which reports=20
>a transition latency of CPUFREQ_ETERNAL. That's really a=20
>problem because=20
>most of the drivers declare such a latency (simply because it's not=20
>known, not really because the transition will take an eternal time).=20
>All userspace daemons suport those drivers, they just don't pay=20
>attention to the transition latency.
>
>This patch proposes to consider a CPUFREQ_ETERNAL latency as=20
>the maximum=20
>possible latency of the governor (10 ms). I think this should be=20
>conservative enough to be safe with any driver.
>
>Hoping you like it,
>Eric
>
>--
>Support for CPUFREQ_ETERNAL drivers by the ondemand governor.
>
>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>--
>
