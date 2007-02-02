From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Speedstep centrino
Date: Fri, 2 Feb 2007 14:04:17 -0800
Message-ID: <EB12A50964762B4D8111D55B764A84540135F027@scsmsx413.amr.corp.intel.com>
References: <45C3AC55.9010004@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <45C3AC55.9010004@goop.org>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>, David Tunkrans <david.tunkrans@gmail.com>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Jeremy Fitzhardinge
>Sent: Friday, February 02, 2007 1:26 PM
>To: David Tunkrans
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: Speedstep centrino
>
>David Tunkrans wrote:
>> I found your email adress in the speedstep centrino kernel=20
>source. Ive
>> put down a lot of time into getting ACPI and speedstep working on my
>> Mac Pro Ubuntu amd64 installation, with no success. Seems like the
>> cpufreq parameters are "missing" even though the specification says
>> that woodcrest Xeons do support speedstep. Also I suspect that there
>> has to be specific support for Xeon processors in this=20
>driver? I would
>> really appreciate if you could point me in the right direction.
>
>In general, the newer CPUs require ACPI support to get the right
>operating point parameters for the CPU; only the older Banias Pentium
>M's have support built directly into the driver.  I don't know if Mac
>Pros have ACPI; perhaps there needs to be some other way of=20
>getting that
>info out of the BIOS, assuming its there at all.
>

Can you try acpi-cpufreq driver instead. If that doesn't work, probably
BIOS is not exporting needed ACPI information to support speedstep. We
will have to look at acpidump and see the BIOS ACPI information.

Thanks,
Venki
