From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpufreq_ondemand
Date: Sun, 17 Oct 2004 21:56:35 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60031DA073@scsmsx403.amr.corp.intel.com>
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
To: Con Kolivas <kernel@kolivas.org>, Alexander Clouter <alex-kernel@digriz.org.uk>
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

>-----Original Message-----
>From: Con Kolivas [mailto:kernel@kolivas.org]=20
>Sent: Sunday, October 17, 2004 3:36 PM
>To: Alexander Clouter
>Cc: Pallipadi, Venkatesh; cpufreq@www.linux.org.uk;=20
>linux-kernel@vger.kernel.org
>Subject: Re: [PATCH] cpufreq_ondemand
>
>Alexander Clouter wrote:
>>> 3. (major) the scaling up and down of the cpufreq is now=20
>smoother.  I found=20
>> 	it really nasty that if it tripped < 20% idle time that=20
>the freq was=20
>> 	set to 100%.  This code smoothly increases the cpufreq=20
>as well as=20
>> 	doing a better job of decreasing it too
>
>I'd much prefer it shot up to 100% or else every time the cpu=20
>usage went=20
>up there'd be an obvious lag till the machine ran at it's=20
>capable speed.=20
>  I very much doubt the small amount of time it spent at 100%=20
>speed with=20
>the default design would decrease the battery life=20
>significantly as well.
>

True. The current ondemand behaviour is by design. When CPU=20
is at the lowest freq, and there is a sudden surge in load,=20
we want it to go to max freq immediately, rather than wait=20
for some more polling intervals. If max freq is too high,=20
it will naturally lower to some intermediate freq later.=20

We can never accurately predict freq for some future load.=20
Say a CPU capable of 600, 800, 1000, 1200 and 1400 KHz, is=20
running at 600 and we have sudden 100% CPU utilization, then=20
we cannot precisely say which should be the next freq. It=20
can be any of the higher possible freqs. And we felt performance=20
should get a higher priority whenever there is some=20
tradeoffs like this.

Thanks,
Venki
