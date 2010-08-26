From: Amit Arora <amit.arora@linaro.org>
Subject: Re: [PATCH 1/3] powertop: Use cpufreqlib for getting cpufreqstats info
Date: Thu, 26 Aug 2010 12:44:35 +0530
Message-ID: <AANLkTinU_OqbcOO6LqQyb7Z_yFm0ddAfx6FFBo4aShym@mail.gmail.com>
References: <1282746211-1227-1-git-send-email-trenn@suse.de>
	<1282746211-1227-2-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1282746211-1227-2-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Renninger <trenn@suse.de>
Cc: power@bughost.org, auke@linux.intel.com, cpufreq@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>

Hello Thomas,

On Wed, Aug 25, 2010 at 7:53 PM, Thomas Renninger <trenn@suse.de> wrote=
:
> Sharing code is a good idea.
> cpufrequtils/libs exist for years and every distribution
> should have them. It's also well maintained and ideally is
> the only userspace tool which needs adjusting if cpufreq
> sysfs api changes at some time.

I agree that it probably makes sense to use the libcpufreq to get
cpufreq information, and don't have any issue with this.

But, if you are suggesting this as alternate to my previous post
(titled "Make PowerTOP generic"), then it doesn't meet the purpose.
The C and P states in powertop still remain hard coded and it doesn't
work well on some of the ARM SoCs (even with this patch applied).

I will probably share some output from one of the ARM boards (OMAP3),
with your patch applied and then with my patch applied on top. This
should help clarify the issue I wanted to target.

PowerTOP output (with and without your below patch applied) :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>
     PowerTOP version 1.13      (C) 2007 Intel Corporation

Cn                Avg residency
C0 (cpu running)        ( 0.0%)
C0              199.2ms (100.0%)
C1                0.0ms ( 0.0%)
C2                0.0ms ( 0.0%)
C3                0.0ms ( 0.0%)
C4                0.0ms ( 0.0%)
Wakeups-from-idle per second :  5.0     interval: 5.0s
<<<<<<

PowerTOP output with my patch applied on top :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>>
     PowerTOP version 1.13      (C) 2007 Intel Corporation

Cn                Avg residency       P-states (frequencies)
C0 (cpu running)        ( 0.0%)
C0              226.3ms (100.0%)
C1                0.0ms ( 0.0%)
C2                0.0ms ( 0.0%)
C3                0.0ms ( 0.0%)
C4                0.0ms ( 0.0%)
C5                0.0ms ( 0.0%)
C6                0.0ms ( 0.0%)

Wakeups-from-idle per second :  4.4     interval: 5.0s
<<<<<<

Please observe the number of C states displayed in the two sets of outp=
ut above.

Thanks!
Regards,
Amit Arora

> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: Amit Arora <amit.arora@linaro.org>
> CC: auke@linux.intel.com
> CC: power@bughost.org
> CC: cpufreq@vger.kernel.org
> ---
> =A0Makefile =A0 =A0 =A0 | =A0 =A01 +
> =A0cpufreqstats.c | =A0 52 ++++++++++++++++++++----------------------=
----------
> =A02 files changed, 21 insertions(+), 32 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e4e1671..ee10a84 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -6,6 +6,7 @@ MANDIR=3D/usr/share/man/man8
> =A0WARNFLAGS=3D-Wall -Wshadow -W -Wformat -Wimplicit-function-declara=
tion -Wimplicit-int
> =A0CFLAGS?=3D-O1 -g ${WARNFLAGS}
> =A0CC?=3Dgcc
> +LDFLAGS =3D -lcpufreq
>
> =A0CFLAGS+=3D-D VERSION=3D\"$(VERSION)\"
>
> diff --git a/cpufreqstats.c b/cpufreqstats.c
> index d10b047..303c3cf 100644
> --- a/cpufreqstats.c
> +++ b/cpufreqstats.c
> @@ -29,6 +29,7 @@
> =A0#include <stdint.h>
> =A0#include <sys/types.h>
> =A0#include <dirent.h>
> +#include <cpufreq.h>
>
> =A0#include "powertop.h"
>
> @@ -100,15 +101,11 @@ static char *HzToHuman(unsigned long hz)
>
> =A0void =A0do_cpufreq_stats(void)
> =A0{
> - =A0 =A0 =A0 DIR *dir;
> - =A0 =A0 =A0 struct dirent *dirent;
> - =A0 =A0 =A0 FILE *file;
> - =A0 =A0 =A0 char filename[PATH_MAX];
> - =A0 =A0 =A0 char line[1024];
> -
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 struct cpufreq_stats *freq_stats, *tmp;
> + =A0 =A0 =A0 int cpu =3D 0, ret =3D 0;
> =A0 =A0 =A0 =A0int maxfreq =3D 0;
> =A0 =A0 =A0 =A0uint64_t total_time =3D 0;
> + =A0 =A0 =A0 unsigned long long time_dummy =3D 0;
>
> =A0 =A0 =A0 =A0memcpy(&oldfreqs, &freqs, sizeof(freqs));
> =A0 =A0 =A0 =A0memset(&cpufreqstrings, 0, sizeof(cpufreqstrings));
> @@ -117,30 +114,21 @@ void =A0do_cpufreq_stats(void)
> =A0 =A0 =A0 =A0for (ret =3D 0; ret<16; ret++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0freqs[ret].count =3D 0;
>
> - =A0 =A0 =A0 dir =3D opendir("/sys/devices/system/cpu");
> - =A0 =A0 =A0 if (!dir)
> + =A0 =A0 =A0 freq_stats =3D cpufreq_get_stats(0, &time_dummy);
> + =A0 =A0 =A0 if (!freq_stats)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Probably cpufreq_stats not compiled =
in or no cpufreq
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0support, printing a debug messag=
e is appropriate */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> - =A0 =A0 =A0 while ((dirent =3D readdir(dir))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int i;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dirent->d_name[0]=3D=3D'.')
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sprintf(filename, "/sys/devices/system/=
cpu/%s/cpufreq/stats/time_in_state", dirent->d_name);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 file =3D fopen(filename, "r");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!file)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(line, 0, 1024);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 0;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (!feof(file)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint64_t f,count;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 char *c;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (fgets(line, 1023,fi=
le)=3D=3DNULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 f =3D strtoull(line, &c=
, 10);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!c)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 count =3D strtoull(c, N=
ULL, 10);
> + =A0 =A0 =A0 /* cpu loop */
> + =A0 =A0 =A0 while (freq_stats) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int i =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D freq_stats;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* freq loop */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (;freq_stats; freq_stats =3D freq_s=
tats->next) {
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long f =3D fre=
q_stats->frequency;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long long coun=
t =3D freq_stats->time_in_state;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (freqs[i].frequency=
 && freqs[i].frequency !=3D f) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0zap();
> @@ -156,11 +144,11 @@ void =A0do_cpufreq_stats(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (i>15)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fclose(file);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpu++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cpufreq_put_stats(tmp);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 freq_stats =3D cpufreq_get_stats(cpu, &=
time_dummy);
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 closedir(dir);
> -
> =A0 =A0 =A0 =A0for (ret =3D 0; ret < 16; ret++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0delta[ret].count =3D freqs[ret].count =
- oldfreqs[ret].count;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0total_time +=3D delta[ret].count;
> --
> 1.6.4.2
>
>
