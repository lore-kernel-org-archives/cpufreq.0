From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Centrino based CPU not recognized
Date: Sun, 19 Nov 2006 15:17:20 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E76762@scsmsx413.amr.corp.intel.com>
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
To: Michael Meskes <meskes@debian.org>
Cc: cpufreq@lists.linux.org.uk



Bug report for nx7400 here
http://bugzilla.kernel.org/show_bug.cgi?id=3D7514
Looks like a lot of people have this problem right now.

From what I see in acpidump in the bug report, BIOS does not
have any ACPI objects needed for frequency control at all. I am certain
That the frequency control will not work with Windows as well on this
platform.
Report it to the BIOS folks...

I am not sure how to check this thing on Windows. I see a
Windows whitepaper on P-states and frequency control here
http://www.microsoft.com/whdc/system/pnppwr/powermgmt/ProcPerfCtrl.mspx=20
May be that will help.

Thanks,
Venki=20

>-----Original Message-----
>From: Michael Meskes [mailto:meskes@debian.org]=20
>Sent: Sunday, November 19, 2006 1:33 AM
>To: Pallipadi, Venkatesh
>Cc: Mattia Dongili; cpufreq@lists.linux.org.uk
>Subject: Re: Centrino based CPU not recognized
>
>Sorry, forgot one more question. Do you guys know how to verify
>speedstepping on Windows? I did not find anything in the XP
>installation, then downloaded a GPLed software call=20
>SpeedstepXP but this
>one also isn't even able to display the actual stepping. This makes it
>look like a BIOS problem, I agree. And gives me a good reason to open
>that call. But again, I'd like to have another program to verify it.
>
>Michael
>
>--=20
>Michael Meskes
>Email: Michael at Fam-Meskes dot De
>ICQ: 179140304, AIM/Yahoo: michaelmeskes, Jabber: meskes@jabber.org
>Go SF 49ers! Go Rhein Fire! Use Debian GNU/Linux! Use PostgreSQL!
>
