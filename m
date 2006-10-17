From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Cpufreq on kernel 2.6.18
Date: Tue, 17 Oct 2006 06:19:55 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454BE3B13@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Joan Moreau <joan.moreau@m4x.org>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Joan Moreau [mailto:joan.moreau@m4x.org]=20
>Sent: Monday, October 16, 2006 1:00 PM
>To: Pallipadi, Venkatesh
>Cc: Luca; cpufreq@lists.linux.org.uk
>Subject: Re: Cpufreq on kernel 2.6.18
>
>
>Thanks for the tip.
>
>I guess the error comes from the Kernel, as all interfaces are their,=20
>but the frequency is not changeable in /sysfs :-(
>
>

If you manually set the governor to userspace and change the frequency
by writing to cpufreq_setspeed does the frequency change?

This looks like same as
http://bugzilla.kernel.org/show_bug.cgi?id=3D7376

Can you confirm?

Thanks,
Venki
