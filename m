From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 15:48:28 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60031DA62A@scsmsx403.amr.corp.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


>-----Original Message-----
>From:       Alexander Clouter <alex-kernel () digriz ! org ! uk>
>Date:       2004-10-17 22:29:16
>Message-ID: <20041017222916.GA30841 () inskipp ! digriz ! org ! uk>
>[Download message RAW]
>
>[Attachment #2 (multipart/mixed)]
>
>
>Hi all,
>
>After playing with the cpufreq_ondemand governor (many thanks=20
>to those whom=20
>made it) I made a number of alterations which suit me at=20
>least.  Really=20
>looking for feedback and of course once people have fixed any=20
>bugs they find=20
>and made the code look neater, possible inclusion?
>
>The improvements (well I think they are) I have made:
>
>1. I have replaced the algoritm it used to one which=20
>calculates the number of
>	cpu idle cycles that have passed and compares it to the=20
>number of cpu
>	cycles it would have expected to pass (for, the=20
>defaults, 20%/80%)
>
>	this means a couple of divisions have been removed,=20
>which is always=20
>	nice and it lead to clearer code (for me at least), that was=20
>	until I added the handful of 'if' conditionals though.... :-/


Good idea. This part of the patch has to go into ondemand governor.
But, I think there is a minor bug in the code though.
With current ondemand governor, we poll at some X freq and check=20
whether we need to increase the freq. And with some Y freq (Y > X and=20
a multiple of it), we check whether we need to decrase the freq.
That is the reason I have two different variables=20
prev_cpu_idle_down and prev_cpu_idle_up to store the previous idle=20
times at these two different polling intervals (X and Y).
Now, you have previous idle time at only one point. So, this may=20
not work cleanly. From the code I feel what will happen is
You will only see the CPU activity in last X time and decide on=20
frequency down decisions (even though you check this with Y polling=20
interval). Not sure whether I was clear with this explanation.

Note, I haven't really run your version yet. This is what=20
I feel by looking at the patch. I may well be wrong.

> 2. controllable through=20
>	/sys/.../ondemand/ignore_nice, you can tell it to=20
>consider 'nice'=20
>	time as also idle cpu cycles.  Set it to '1' to treat=20
>'nice' as cpu=20
>	in an active state.
>

OK. This has to be in ondemand governor as well.

>3. (major) the scaling up and down of the cpufreq is now=20
>smoother.  I found=20
>	it really nasty that if it tripped < 20% idle time that=20
>the freq was=20
>	set to 100%.  This code smoothly increases the cpufreq=20
>as well as=20
>	doing a better job of decreasing it too
>
>4. (minor) I changed DEF_SAMPLING_RATE_LATENCY_MULTIPLIER to 50000 and
>	DEF_SAMPLING_DOWN_FACTOR to 5 as I found the defaults a=20
>bit annoying=20
>	on my system and resulted in the cpufreq constantly jumping.
>
>	For my patch it works far better if the sampling rate=20
>is much lower=20
>	anyway, which can only be good for cpu efficiency in=20
>the long run

Somehow, I feel quick response time for increased load is more=20
important than smooth increase in frequency. As the CPU latency for=20
doing the freq transition is lower, I think governor should use that=20
and do quick adjustments to the freq depending on the load. Probably, I=20
am thinking more in terms of places where performance is critical.
As Dominik pointed out, it's the time to fork put a new ondemand=20
governor with this algorithm....

>5. the grainity of how much cpufreq is increased or decreased=20
>is controlled=20
>	with sending a percentage to /sys/.../ondemand/freq_step_percent
>
>6. debugging (with 'watch -n1 cat=20
>/sys/.../ondemand/requested_freq') and=20
>	backwards 'compatibility' to act like the 'userspace'=20
>governor is=20
>	avaliable with /sys/.../ondemand/requested_freq if=20
>	'freq_step_percent' is set to zero

I again agree with Dominik's opinion on this :)

Thanks for all the experiments and all these improvements.
I will rollout a patch for ondemand governor soon, by=20
stealing some code from your patch below :)

Thanks,
Venki
