From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] (1/1) cpufreq_conservative
	-cpufreq_conservative-2.6.11-rc3-mm2.diff
Date: Mon, 21 Feb 2005 10:01:42 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60040DBCC5@scsmsx403.amr.corp.intel.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>


>-----Original Message-----
>From: cpufreq-bounces@ZenII.linux.org.uk=20
>[mailto:cpufreq-bounces@ZenII.linux.org.uk] On Behalf Of Bruno Ducrot
>Sent: Monday, February 21, 2005 8:41 AM
>To: Dominik Brodowski
>Cc: davej@redhat.com; cpufreq@ZenII.linux.org.uk;=20
>alex-kernel@digriz.org.uk; Alexander Clouter
>Subject: Re: [PATCH] (1/1) cpufreq_conservative=20
>-cpufreq_conservative-2.6.11-rc3-mm2.diff
>
>On Mon, Feb 21, 2005 at 04:52:19PM +0100, Dominik Brodowski wrote:
>> On Mon, Feb 21, 2005 at 04:33:43PM +0100, Bruno Ducrot wrote:
>> > > +		__cpufreq_driver_target(policy,
>> > > +			requested_freq[cpu],
>> > > +			CPUFREQ_RELATION_H);
>> >                         ^^^^^^^^^^^^^^^^^^
>> >                       Please use CPUFREQ_RELATION_L
>>=20
>> _L means CPU frequency is _larger_ than (or equal to)=20
>requested_freq[cpu] but=20
>> as _low_ as possible.
>>=20
>> _H means CPU frequency is _lower_ than (or equal to)=20
>requested_freq[cpu] but=20
>> as _high_ as possible.
>>=20
>> So, AFAICS, _H is correct here.
>
>	if (idle_ticks > down_idle_ticks ) {
>		/* go down by 5% */
>		...
>		__cpufreq_driver_target(policy, requested_freq[cpu],
>			 CPUFREQ_RELATION_H);
>		...
>	}
>	...
>
>
>The first __cpufreq_driver_target() is correct, but the latter should
>be CPUFREQ_RELATION_L, which exactly match your words:
>
>> _L means CPU frequency is _larger_ than (or equal to)=20
>requested_freq[cpu] but=20
>> as _low_ as possible.
>

Actually, the reason it is RELATION_H in both cases is:
- In this particular piece of code, we want to reduce the freq to next
lowest freq. But, as we don't know the allowed freq, we just do
(cur_freq - 5) and try to go to next freq lower than 95%.
- If we use RELATION_H here, and if there is no freq supported between
95% and 100%, then we will never be able to reduce the freq.

So, even though the code is kind of counter-intuitive, I think it is
doing the right thing.

Thanks,
Venki
