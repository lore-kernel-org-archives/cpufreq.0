From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand governor and passive cooling broken?
Date: Wed, 24 Aug 2005 12:09:00 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB600588ED10@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
To: Thomas Renninger <mail@renninger.de>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Thomas Renninger [mailto:mail@renninger.de]=20
>Sent: Saturday, August 20, 2005 9:49 PM
>To: Dominik Brodowski
>Cc: cpufreq@lists.linux.org.uk; Pallipadi, Venkatesh
>Subject: Re: ondemand governor and passive cooling broken?
>
>Hi,
>
>This makes ondemand governor aware of thermal limits.
>The policy was buffered and new policy values never reached=20
>the governor.

I don't think there is an issue with buffering here.
This_dbs_info->cur_policy is a pointer to the cpufreq policy (and not
allocated by ondemand governor). So, any change to max/min in cpufreq
should be automatically getting reflected. Atleast that was the intent
with having policy pointer. If it is not happening then that should be a
bug. I don't think that this memcpy is required here.

>I just used the cpufreq_get_policy call every time the load is checked,
>maybe the new policy should be made available via notifier as=20
>it is done
>for the cur_freq in the userspace governor?
>If this sounds reasonable I can come up with a bigger patch on Monday.
>
>However, thermal cooling still does not always work right:
>
>  - Sometimes the limit is not decreased correctly in polling=20
>frequency time
>    (I saw it at max for more than 20 secs, polling freq 5=20
>secs, passive tp exceeded).
>    Strange enough, that seems to happen only in rare cases.
>  - I also saw the limit stuck at lowest frequency even after=20
>getting back in
>    normal temperature zones.

I think we need to do some more things to intergrate cpufreq and thermal
cooling. Especially in relation to polling frequency. Probably, ondemand
governor should slow down its polling interval to something higher than
thermal polling frequency as soon as it notices the passive cooling is
on.


Thanks,
Venki
