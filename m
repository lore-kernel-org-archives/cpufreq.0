From: Christian Heimanns <heimanns@versanet.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Sat, 07 Aug 2004 16:40:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4114E9C1.8070409@versanet.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040807131432.GA8934@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>


>>) with=20
>>no success. The module won't load. I'm not sure that the mistake is=20
>>using kernel 2.6.8-rc3 instaed of rc2?
>>
>>modprobe acpi
>>FATAL: Error inserting acpi=20
>>(/lib/modules/2.6.8-rc3-bk1/kernel/arch/i386/kernel/cpu/cpufreq/acpi.ko=
):=20
>>No such device
>=20
>=20
> Just to make sure: the error doesn't appear without the patch?
>=20

Compiling takes a while ;-)
Without the patch the kernelmodule acpi.ko loads without problems. I'm=20
waiting for new orders :-)


--=20
---
Christian Heimanns
heimanns@versanet.de

### Pinguine k=C3=B6nnen nicht fliegen
- Pinguine st=C3=BCrzen auch nicht ab! ###
