From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpufreq_(ondemand|conservative) (round three)
Date: Wed, 10 Nov 2004 17:27:07 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600351CB3F@scsmsx403.amr.corp.intel.com>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Alexander Clouter <alex@digriz.org.uk>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk
Cc: linux@dominikbrodowski.de


Thanks for the patches. Here are some comments about _ondemand patches.

(1) 00_consistency patch
I think it is OK to do this for sampling_rate. But, we may have some
nasty races / corner conditions if we do this for up_threashold and
down_threshold. The race I am thinking about is: we check the new
down_value with old up_value and we may end up finally with
down_threshold greater than up_threshold.

(2) 01_ignore-nice
The idea to have this is good. Somehow I am thinking of some corner
cases here too.
If the prev_cpu_idle_up and prev_cpu_idle_down have unconditionally
include nice and total_ticks includes it conditionally, then we cannot
do the proper subtract and compare of idle times. Am I missing anything
here?

(3) 02_check-rate-and-break-out
This looks good and ready to go.=20

(4) 03_sys_freq_step
Looks good. One minor issue. Policy->max can change at run time (when
a/c power and battery power). So behaviour might change if you
initialize freq_step once instead of checking 5% of max during each
switching. But, doing it this way should be OK too, as 5% is not a
strict number.

Thanks,
Venki
