From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand vs suspend.
Date: Mon, 26 Jun 2006 15:12:23 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84541D4F8C@scsmsx413.amr.corp.intel.com>
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
>Sent: Monday, June 26, 2006 1:59 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq@lists.linux.org.uk; pjones@redhat.com
>Subject: Re: ondemand vs suspend.
>
>Pallipadi, Venkatesh wrote:
>> Looks like scaling_max_freq on both CPUs got set to 1000000=20
>somehow. Due
>> to that all the frequency changes are failing from then on. If you
>> manually write 1833000 to scaling_max_freq, things should=20
>come back to
>> normal.
>>  =20
>Yup.  I'd overlooked that one.
>
>Something very strange is going on.  If I do:
>
>   1. set both CPUs to conservative
>   2. set CPU1 to performance
>   3. looks OK for a while, then...
>   4. CPU1's max speed drops to 1GHz
>   5. (then goes back; both CPUs switch to full speed; all kinds of
>      strangeness)
>
>I have the gnome cpufreq applet running, but its just reading=20
>scaling_cur_freq for each CPU.
>Hm, and now both CPUs are apparently running at full speed.


Strange. I guess only scaling_max_freq is changing and not
cpuinfo_max_freq. Right?
Can you try stopping the applet and see whether anything changes?
Is the system idle while these changes happen or the load is varying
causing some frequency changes by conservative on CPU 0?

I am not able to reproduce this with periodic reading of
scaling_cur_freq. May be soemthing else is happening from userlevel that
is causing this..

>> governor was resulting in something like this. But, that patch is
>> already in mm1.=20
>>  =20
>Which mm1?  I'm still running 2.6.17-rc6-mm2, because I'm depending on=20
>some AHCI suspend/resume patches which haven't been updated yet.  Hm,=20
>but that change does seem pretty old.

I was referring to linux-2.6.17-mm1. But, that patch should be there in
2.6.17-rc6 as well.

>> I guess, there is some other corner case where=20
>scaling_max_freq can get
>> set.
>>  =20
>Yes.  This doesn't appear to be a race with anything, since the=20
>spontaneous change seems to happen unrelated to anything else, unless=20
>reading the sysfs entries can cause a problem.
>

Can you enable cpufreq.debug and capture the log.=20

Thanks,
Venki
