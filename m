From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] cpu freq groups (policy->cpus) in ondemand governor
Date: Tue, 2 Nov 2004 09:55:09 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60033E4702@scsmsx403.amr.corp.intel.com>
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
To: Stefan Seyfried <seife@gmane0305.slipkontur.de>, cpufreq@www.linux.org.uk

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Stefan Seyfried
>Sent: Tuesday, November 02, 2004 1:34 AM
>To: cpufreq@www.linux.org.uk
>Subject: Re: [PATCH] cpu freq groups (policy->cpus) in=20
>ondemand governor
>
>On Tue, Oct 26, 2004 at 11:39:49AM -0700, Venkatesh Pallipadi wrote:
>=20
>> Now ondemand governor looks at all cpus in policy->cpus and=20
>takes its=20
>> frequency increase/decrease decisions based on most lightly=20
>loaded cpu in=20
>> the group.
>
>Is this a good idea? Assume the pathetic case:
> - 2 cpus, both in one group
> - 1 process running at 100% CPU
>   -> only 1 cpu loaded
>      -> the 2nd cpu is idle
>         -> no speed increase.
>
>Or didn't i understand this correctly?

Actually, you are right. And the patch is right too. But, the=20
patch description that I typed in was totally opposite to=20
what I had in my head :(. It should read:

Now ondemand governor looks at all cpus in policy->cpus and=20
takes its frequency increase/decrease decisions based on most=20
busy cpu in the group.

In the patch I am looking at the CPU with least idle time=20
and depend on it to increase or decrease the frequency.

Thanks,
Venki
