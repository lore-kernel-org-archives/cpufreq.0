From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [2.6.9-rc2] ondemand governor not working
Date: Wed, 15 Sep 2004 13:34:44 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002E1C5AA@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
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
To: kronos@kronoz.cjb.net
Cc: cpufreq@www.linux.org.uk

=20

>-----Original Message-----
>From: Kronos [mailto:kronos@kronoz.cjb.net]=20
>Sent: Wednesday, September 15, 2004 12:24 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@www.linux.org.uk
>Subject: Re: [2.6.9-rc2] ondemand governor not working
>
>Il Wed, Sep 15, 2004 at 09:48:37AM -0700, Pallipadi, Venkatesh=20
>ha scritto:=20
>> How about this patch?
>>=20
>>
>> --- linux-2.6.9-rc2//drivers/cpufreq/cpufreq_ondemand.c.org=09
>2004-09-15 11:32:38.000000000 -0700
>> +++ linux-2.6.9-rc2//drivers/cpufreq/cpufreq_ondemand.c=09
>2004-09-15 11:36:43.000000000 -0700
>> @@ -344,8 +344,14 @@ static int cpufreq_governor_dbs(struct c
>>  		 * is used for first time
>>  		 */
>>  		if (dbs_enable =3D=3D 1) {
>> +			unsigned int latency;
>>  			/* policy latency is in nS. Convert it=20
>to uS first */
>> -			def_sampling_rate =3D=20
>(policy->cpuinfo.transition_latency / 1000) *
>> +
>> +			latency =3D policy->cpuinfo.transition_latency;
>> +			if (latency < 1000)
>> +				latency =3D 1000;
>> +
>> +			def_sampling_rate =3D (latency / 1000) *
>>  				=09
>DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;
>>  			dbs_tuners_ins.sampling_rate =3D=20
>def_sampling_rate;
>
>It fixes the sampling rate, but the governor isn't working as expected.
>powernow_target gets called but even when the cpu usage is at 100% the
>target frequency is 441877 (which is 535608 - 93731, cur_policy->cur -
>freq_down_step). The governor tries to lower the frequency=20
>even when the
>CPU is loaded.
>

Hmm.. Looks like we are hitting some other corner case with sampling
freq=20
set to 1 mS, which is kind of too low. Can you try increasing it to 10mS
or 100mS and see whether the driver works as expected.
You can do that either in /sys interface under sys/../cpufreq/ondemand
or change the latency in the previous patch (something like this).
>> +			if (latency < 1000)
>> +				latency =3D 100000;

Thanks,
Venki
