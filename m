From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 22:50:52 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB60077930@scsmsx403.sc.intel.com>
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
To: Dominik Brodowski <linux@brodo.de>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>



> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@brodo.de]=20
>=20
> > +#define DBS_RATE		(HZ/4)	/* timer rate is 250ms */
> > +#define LOW_LATENCY_FREQUENCY_CHANGE_LIMIT 	100 /* in uS */
> That's really low. latency_timer is in 10^(-9) s =3D=3D ns [see
cpufreq.h], so I=20
> think you're missing a factor of 1000 here -- but maybe some drivers
miss a=20
> factor of 1000, too...

Yes. I got confused about this after seeing drivers using it as uS in
place of nS.
Will fix it. I will also look at the drivers and fix them.

Thanks,
-Venkatesh
