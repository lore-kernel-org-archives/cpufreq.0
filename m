From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code to make MSR
	support addition easier
Date: Mon, 2 Oct 2006 16:44:19 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC2BC@scsmsx413.amr.corp.intel.com>
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

=20

>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Monday, October 02, 2006 4:43 PM
>To: Pallipadi, Venkatesh
>Cc: Starikovskiy, Alexey Y; Dave Jones; cpufreq
>Subject: Re: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code=20
>to make MSR support addition easier
>
>On Mon, Oct 02, 2006 at 04:32:05PM -0700, Pallipadi, Venkatesh wrote:
>> Ohh OK. I understand your point. Good catch.
>> get_cur_freq_on_cpu() is used in ->get() method for IO port driver.
>> It will work OK with get method when previous set transition is
>> successful. But, it will give strange result when previous set is not
>> successful. Is this the case you were mentioning.=20
>
>Yes.=20

I will change this in next rev of the patch, so that ->get() method will
only be initialized in MSR mode.

Thanks,
Venki
