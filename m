From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] Set min and max frequencies
Date: Sun, 20 Jul 2008 09:54:31 +0200
Message-ID: <20080720075431.GA22597@isilmar.linta.de>
References: <Pine.LNX.4.64.0807181817530.16435@mustang.lysator.liu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0807181817530.16435@mustang.lysator.liu.se>
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
To: Adam =?iso-8859-1?Q?Engstr=F6m?= <ae@lysator.liu.se>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

Hi,

On Fri, Jul 18, 2008 at 06:38:48PM +0200, Adam Engstr=F6m wrote:
> This patch fixes a bug with that the scaling min and max frequencies are =

> not set when they are not entirely correctly specified. For example =

> setting max frequency to 500000 when that frequency is 500040 according t=
o =

> the frequency table.

but what if the CPU supports many many different frequencies (like
gx-suspmod) and the user wants to set the max to 5000000 instead of 501000 ?
or instead of 500500 ?

> +	if (policy->max < data->min)
> +		policy->max =3D data->min;

if the new maximum value is smaller than the current minimum value, we set
the new maximum value to the old minimum value? Why?
let's assume the old policy was		300000 kHz to 500000 kHz
and the new policy should be		100000 kHz to 200000 kHz

why is this overwritten to be		100000 kHz to 300000 kHz ?

> +	if (policy->min > data->max)
> +		policy->min =3D data->max;

similar issue. NACK.

> =

> And here is a second patch that makes sure that all values are accepted.
> =

> Index: freq_table.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /usr/local/cvsroot/cpufreq/freq_table.c,v
> retrieving revision 1.1
> retrieving revision 1.5
> diff -u -r1.1 -r1.5
> --- freq_table.c	16 Jul 2008 22:01:23 -0000	1.1
> +++ freq_table.c	18 Jul 2008 10:24:31 -0000	1.5
> @@ -120,6 +120,26 @@
>  	if (!cpu_online(policy->cpu))
>  		return -EINVAL;
>  =

> +	/* Make sure to catch corner cases such as specifying a target
> +	   max and min that both are below the physical min
> +	   frequency. */
> +	unsigned int max =3D 0;
> +	unsigned int min =3D ~0;
> +	for (i=3D0; (table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
> +		unsigned int freq =3D table[i].frequency;
> +		if (freq =3D=3D CPUFREQ_ENTRY_INVALID)
> +			continue;
> +
> +		if (freq < min)
> +			min =3D freq;
> +		if (freq > max)
> +			max =3D freq;
> +	}
> +	if (policy->min < min)
> +		policy->min =3D min;
> +	if (policy->max > max)
> +		policy->max =3D max;
> +

NACK. If we're to do such things, we should to it generically in cpufreq.c
(in the input routines) instead of just for freq-table-dependant drivers.
Also cpuinfo->{min,max}_freq exist and could be used for this purpose.
Furthermore:

# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
2001000
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
800000
# echo 3000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq =

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
2001000

(same results if you use cpufrequtils' cpufreq-info and cpufreq-set, of
course)

So this seems to me to be a non-issue.

Best,
	Dominik
