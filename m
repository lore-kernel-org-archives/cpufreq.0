From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: scaling_max_freq == scaling_min_freq when on battery
Date: Mon, 23 May 2005 13:06:45 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6004CB340B@scsmsx403.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Eugenio <eugenio@lumachedelcervello.cjb.net>, cpufreq@lists.linux.org.uk


This limitation must be coming from BIOS. It seems BIOS has decided not=20
to let CPU run at higher than 600MHz when on battery.=20

Thanks,
Venki


>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Eugenio
>Sent: Monday, May 23, 2005 11:01 AM
>To: cpufreq@lists.linux.org.uk
>Subject: scaling_max_freq =3D=3D scaling_min_freq when on battery
>
>i installed ubuntu on my laptop (an asus A3500, with a=20
>pentium-m 1.6Ghz)
>cpufreq works nice when on AC, switching from 600Mhz to 1.6Ghz but when
>on battery it fix the frequence at 600. i tried all the
>speedstep-related bios option but with no result. any hint?
>thanks.
>
>Eugenio
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
