From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 11:57:58 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6007791F@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>



> -----Original Message-----
> From: Ducrot Bruno [mailto:ducrot@poupinou.org]=20
> Sent: Tuesday, October 21, 2003 10:56 AM
>=20
> > It will work any processor=20
> > that is ACPI compatible and again there are no specific=20
> > checks for Intel here.
> >=20
>=20
> On a K7 with powernow for example, perf_ctrl and perf_data=20
> will be MSR 0
> with your patch, that do not make sence.
> Even if you know the correct MSRs, the values for 'control'=20
> and 'status'
> in _PSS packages will be only bit-fields, and they can *not* be
> written nor read directly to the (correct) MSRs (again for K7=20
> powernow).
>=20
> This is because the FfixedHW is only an indication that a CPU specific
> 'feature' (even though already somehow defined in ACPI like P-state,
> C-state, etc.) have to be handled by the OS in a non-acpi driver, as
> per ACPI spec, and that will be dependant of the CPU.
>=20

Agree with most of your comments.=20
Current ACPI P-state driver ignored everything other than SYSTEM_IO.
And we are trying to add support for FIXED_HW. I was unaware of
any other CPU using ACPI PCT FIXED_HW to mean anything other than
MSR. As you mentioned, if K7 indeed exports some ACPI-PCT information=20
to mean something else, then that is a real bug in my patch. I will=20
add CPU specific abstraction to handle FIXED_HW get/set functions in=20
the next revision of the patch.=20

Thanks,
-Venkatesh
