From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
	Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 08:58:12 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60067F3CAD@scsmsx403.amr.corp.intel.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: CPUFreq@lists.linux.org.uk, davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>

=20

>-----Original Message-----
>From: Bruno Ducrot [mailto:ducrot@poupinou.org]=20
>Sent: Friday, December 02, 2005 7:04 AM
>To: Pallipadi, Venkatesh
>Cc: Felix Braun; CPUFreq@lists.linux.org.uk; davej@redhat.com;=20
>Dominik Brodowski
>Subject: Re: [PATCH 2.6.14] cpufreq: don't suggest=20
>speedstep-centrino for Dothan-based Celeron-M processors
>
>On Fri, Dec 02, 2005 at 06:26:52AM -0800, Pallipadi, Venkatesh wrote:
>>=20
>> I think from user perspectibe, P4-clockmod is most confusing driver
>> ever. P4-clockmod will only do the duty-cycle based=20
>throttling and will
>> not save any significant power. In fact, CPU may end up=20
>consuming more
>> power than without it for a constant amount of unit-work (Dominik has
>> patiently explained it quite a few times on this list). It will only
>> help in thermal conditions and ACPI throttling driver should=20
>handle that
>> anyway. Given this: I vote for removing p4-clockmod altogether from
>> cpufreq drivers. Dave, Dominik: do you agree?
>
>-1
>
>There is an infrastructure in order to cool the processor with
>cpufreq.  Doing what you propose disallow people with such
>configurations to use ACPI passive cooling.
>

I agree with the intent of providing infrastructure for cooling.
But, doing it along with the other cpufreq drivers that save power=20
is not good IMHO.

I mean,=20
- For end user it appears as if another way to change the frequency=20
to save power.
- Support for cooling doesn't work when CPU also supports freq/voltage=20
scaling. Say a Enhanced Speedstep capable P4 CPU can still do throttling

for cooling. But, current cpufreq doesn't support that.
- Cooling driver should ideally be triggerred by thermal events and that

doesn't seem to happen either.

>I propose instead that we use some sort of flags such
>that only cpufreq driver which are able to scale voltages, or
>knowns to ofer good power savings, use the policy/governor
>stuff.

I was thinking of a cpufreq clone that does similar things to idle-state

(C-state) as cpufreq does to frequency/voltage (P-state) states.
Probably we=20
need to have another similar set of APIs for cooling (T-state) as well.
Are=20
there any other low-level drivers that provide P4-clockmod kind of
cooling=20
support. Clubbing them together under a different umbrella, we may be
able to=20
separate them from the power-saving frequency change drivers.

For short term though, atleast there need to be some big Red flag
against=20
using p4-clockmod for powersave purposes. Having that info in CONFIG
help=20
doesn't seem to be working.

Thanks,
Venki
