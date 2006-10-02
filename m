From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 6/8]cpufreq: acpi-cpufreq: Eliminate get of current freq
	on notification
Date: Mon, 2 Oct 2006 16:16:37 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC281@scsmsx413.amr.corp.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>


>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Sunday, October 01, 2006 5:52 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq; Starikovskiy, Alexey Y
>Subject: Re: [PATCH 6/8]cpufreq: acpi-cpufreq: Eliminate get=20
>of current freq on notification
>
>Hi,
>
>On Sun, Oct 01, 2006 at 07:15:45AM -0700, Venkatesh Pallipadi wrote:
>> Only change the frequency if the state previously set is different
>> from what we are trying to set. We don't really have to get=20
>the current
>> frequency at this point.
>
>What if it changed behind our back? Shouldn't happen, I know,=20
>but it does
>happen.
>
>	Dominik

Yes. It happens and it can happen more often with multi-core CPUs which
has hardware coordination set up. Changing frequency on one CPU can
affect other CPU in the same package. But, changing frequency behind the
back does not matter on recent CPUs, as TSC is constant across P-state.
Also, depending on frequency that changes behind the back is not good.
If something changed behind the back, it will also later revert back to
original state in the same way. So, if we get current frequency in
between and take some decision based on that, will be bad.
Example:
- User has set the frequency to P0.
- TM2 kicks in and reduces the frequency to P3 state.
- Now user wants to reduce the frequency to P3 (This is the point where
above current freq was being checked).
- At this time, we can do two things
Option 1)
- Get the current frequency and see that we are in P3.
- Do not change the frequency as per user request.
- Now once TM2 event goes away (temperature is under control), CPU goes
back to P0, which was original user set state.

Option 2)
- Look at what user had set previously (P0) and set the state to P3
(even though we are in that state due to P3).
- Now once TM2 event goes away (temperature is under control), CPU goes
back to last user set state in this case P3.

Option 2 is what is ideal and the patch does it that way. Same example
as above can happen with hardware coordination as well.

Thanks,
Venki
