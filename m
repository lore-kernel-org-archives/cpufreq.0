From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] ondemand governor clean-ups
Date: Mon, 7 Feb 2005 10:47:56 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003F34484@scsmsx403.amr.corp.intel.com>
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

=20

Hi,

Thanks for the patch. Looks good. Can you also remove the #define for
sampling_rate_in_HZ, as it is no longer required.

Thanks,
Venki

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Sunday, February 06, 2005 3:06 PM
>To: Pallipadi, Venkatesh; Nakajima, Jun
>Cc: cpufreq@ZenII.linux.org.uk
>Subject: [PATCH] ondemand governor clean-ups
>
>Hello,
>
>Having a look at the ondemand governor I noticed some possible trivial=20
>and minimal clean-ups.
>
>Here they are:
>- change from sampling_rate_in_HZ() to the official function=20
>usecs_to_jiffies().
>- use for_each_online_cpu() to instead of using "if (cpu_online(i))"
>
>Those are just trivial clean-ups, please apply,
>Eric
>--
>Trivial ondemand governor clean-ups
>
>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>--
>
