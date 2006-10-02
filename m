From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 4/8]cpufreq: acpi-cpufreq: Mark speedstep-centrino ACPI
	as deprecated
Date: Mon, 2 Oct 2006 16:06:37 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC267@scsmsx413.amr.corp.intel.com>
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
>Sent: Sunday, October 01, 2006 5:48 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq; Starikovskiy, Alexey Y
>Subject: Re: [PATCH 4/8]cpufreq: acpi-cpufreq: Mark=20
>speedstep-centrino ACPI as deprecated
>
>Hi,
>
>>  	help
>> -	  Use primarily the information provided in the BIOS ACPI tables
>> +	  This is deprecated and this functionality is now merged into
>> +	  acpi_cpufreq (X86_ACPI_CPUFREQ). Use that driver instead of
>> +	  speedstep_centrino.
>> +	  Was used primarily the information provided in the=20
>BIOS ACPI tables
>>  	  to determine valid CPU frequency and voltage pairings.
>
>Even though I'm no expert in the English language, this new=20
>sentence ("Was
>used ...") looks a bit strange to me - maybe just leave it=20
>with "Use" and
>only add the paragraph above?
>

Agreed that sentence doesn't make any sense. Looks like I was partially
asleep while editing that config file :(. Will change it in next rev.

Thanks,
Venki
