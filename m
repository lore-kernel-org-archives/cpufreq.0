From: "Brown, Len" <len.brown@intel.com>
Subject: RE: [PATCHSET] 0/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Mon, 3 Nov 2003 22:14:23 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <BF1FE1855350A0479097B3A0D2A80EE0CC87F7@hdsmsx402.hd.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Jan Rychter <jan@rychter.com>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Mukesh Rajan <megabyte1024@hotmail.com>, cpufreq@www.linux.org.uk, linux-acpi <linux-acpi@intel.com>


> I have done some measurements on a Toshiba S7/290LNKW,
> which has a 900MHz Pentium-M. The results have been posted to=20
> this list a while ago -- the most surprising one being that the=20
> Pentium-M in that machine seemed to always consume the same
> amount of power when idle, independent of operating frequency.
> The frequency only made a difference
> when the CPU was actually doing something (or when I made it=20
> not use the C3 state by loading usb-uhci).

Probably the cpu is running HLT in the idle loop,
so the power consumption there would not vary with MHz.

Cheers,
-Len
