From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpufreq_(ondemand|conservative)
Date: Mon, 31 Jan 2005 15:40:24 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003E65CFF@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
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
To: Alexander Clouter <alex@digriz.org.uk>, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@ZenII.linux.org.uk

=20

>-----Original Message-----
>From: Alexander Clouter [mailto:alex@digriz.org.uk]=20
>Sent: Saturday, January 29, 2005 3:21 PM
>To: Dominik Brodowski
>Cc: Pallipadi, Venkatesh; cpufreq@lists.linux.org.uk
>Subject: Re: [PATCH] cpufreq_(ondemand|conservative)
>
>Dominik,
>
>I was starting to wonder if anyone received my patches as so far _zero_
>feekback :)
>
>On Jan 29, Dominik Brodowski wrote:
>> concerning patch #1:
>>=20
>> On Sun, Jan 23, 2005 at 03:00:01PM +0000, Alexander Clouter wrote:
>> > @@ -398,10 +455,10 @@
>> >  	=09
>> >  			j_dbs_info->prev_cpu_idle_up =3D=20
>> >  				kstat_cpu(j).cpustat.idle +
>> > -				kstat_cpu(j).cpustat.iowait;
>> > -			j_dbs_info->prev_cpu_idle_down =3D=20
>> > -				kstat_cpu(j).cpustat.idle +
>> > -				kstat_cpu(j).cpustat.iowait;
>> > +				kstat_cpu(j).cpustat.iowait +
>> > +				kstat_cpu(j).cpustat.nice;
>>=20
>> Why are you adding cpustat.nice here unconditionally? You=20
>don't do so in the
>> sysfs write method, so I assume you should make this dependant on=20
>> ignore_nice here as well.
>>=20
>Well by default 'ignore_nice =3D 0' so is there a need?  Look in=20
>the next hunk.
>

Probably it is better idea to have a if, even if the default is 0, as
If we change the default in future, we don't have to look for all these
dependent changes.

Thanks,
Venki
