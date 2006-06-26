From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand vs suspend.
Date: Mon, 26 Jun 2006 13:24:52 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84541D4E87@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Jeremy Fitzhardinge [mailto:jeremy@goop.org]=20
>Sent: Monday, June 26, 2006 12:23 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq@lists.linux.org.uk; pjones@redhat.com
>Subject: Re: ondemand vs suspend.
>
>Pallipadi, Venkatesh wrote:
>> I am not able to reprocude this on my Core Duo system.  At=20
>this point I
>> will need some more information on what exactly happens at=20
>this point of
>> failure to start looking at the code.. Like questions above. Does
>> scaling_available_frequencies still show all freqs. What is *max *min
>> values in /sys/.../cpufreq/ ..
>>  =20
>Yes, all the expected frequencies are there.  I sent you mail with all=20
>the contents of /sys/.../cpu?/cpufreq/... the other day;=20
>should I resend it?
>

Sorry. I had missed your earlier mail.

Looking at the info you had sent..
> cpufreq/scaling_max_freq:
> 1000000
> cpufreq/scaling_min_freq:
> 1000000
> cpufreq/cpuinfo_max_freq:
> 1833000
> cpufreq/cpuinfo_min_freq:
> 1000000

Looks like scaling_max_freq on both CPUs got set to 1000000 somehow. Due
to that all the frequency changes are failing from then on. If you
manually write 1833000 to scaling_max_freq, things should come back to
normal.

Now the question is: Why is scaling_max_freq getting set to 1000000.
There was one patch here from thomas, that fixed a race between _PPC
call to reduce the freq and some other action in setting cpufreq
governor was resulting in something like this. But, that patch is
already in mm1.=20
http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
c
ommitdiff;h=3D7970e08bf066900efcd7794a1a338c11eb8f5141;hp=3Df1f76afd71e0f=
17a
f9a35fcb649f4bab53304a4d

I guess, there is some other corner case where scaling_max_freq can get
set.

> My startup scripts set the governor for both CPUs to conservative.
Then=20
> later, not long after boot, with no suspend, I set them to=20
> "performance", but they don't switch speed.=20

Somewhere inbetween this max got changed. Can you check it soon after
changing the governor to conservative?

Thanks,
Venki
