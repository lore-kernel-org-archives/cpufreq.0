From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Centrino based CPU not recognized
Date: Sat, 18 Nov 2006 09:23:44 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E766ED@scsmsx413.amr.corp.intel.com>
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
To: Michael Meskes <meskes@debian.org>, Mattia Dongili <malattia@linux.it>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Michael Meskes
>Sent: Saturday, November 18, 2006 9:16 AM
>To: Mattia Dongili
>Cc: cpufreq@lists.linux.org.uk; meskes@debian.org
>Subject: Re: Centrino based CPU not recognized
>
>On Sat, Nov 18, 2006 at 01:38:27PM +0100, Mattia Dongili wrote:
>> did you tried both of acpi-cpufreq and speedstep-centrino? I have the
>
>Yes, both give ENODEV. But I haven't debugged acpi-cpufreq as much. All
>I know is that acpi_cpufreq_cpu_init is called twice with the second
>call seemingly returning -ENODEV.
>
>> same cpu working here with the former module since=20
>2.6.19-rcX-mm while
>> it worked with the latter at 2.6.1[78] times.
>
>I read some reports that the old coreduo cpus stopped working when the
>current bios was released. They seemed to work before. However, the old
>bios doesn't work with core2duo's. It's an HP NX7400 in case I didn't
>mention.=20
>

What is the BIOS version btw?

There was a similar report here
http://bugme.osdl.org/show_bug.cgi?id=3D7157
about HP NC6400

-Venki
