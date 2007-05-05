From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 15:58:10 +0200
Message-ID: <463C8D72.5070003@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
	<1178311052.6094.0.camel@localhost.localdomain>
	<Pine.LNX.4.61.0705042259160.18504@yvahk01.tjqt.qr>
	<1178318978.6094.29.camel@localhost.localdomain>
	<Pine.LNX.4.61.0705050130090.18504@yvahk01.tjqt.qr>
	<463C01FA.8070206@interia.pl>
	<Pine.LNX.4.61.0705051000030.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.61.0705051000030.18504@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: john stultz <johnstul@us.ibm.com>, cpufreq@lists.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, davej@codemonkey.org.uk

>>>>> Switching from acpi_pm+performance to acpi_pm+ondemand also
>>>>> locks up after a few minutes.
>>>> Yep. Sounds like an ondemand issue. Thanks for verifying this for me.
>>> Nah, it also happens with cpufreq_powersave. I just need to check=20
>>> through some archives and try booting with governor=3Dpowersave so that=
 it=20
>>> always stays low.=20
>> You have a lockup when switching from other governor to powersave? Or if=
 =20
>> You are using it for some time?
>=20
> After some time.
Don't understand me wrong, but this is very weird. I think that powersave i=
s =20
changing frequency only one time, when it is loaded. I will look into its c=
ode=20
to be sure. Probably Longhaul is making something what isn't allowed or the=
re=20
is hardware bug somewhere.
> Jan
Rafa=B3



----------------------------------------------------------------------
Po meczu.....kurde...:)
>>> http://link.interia.pl/f1a72
