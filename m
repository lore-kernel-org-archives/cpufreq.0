From: Matteo <nemesi@ngi.it>
Subject: Re: Call4Response: Correct PST table for ATHLONs
Date: Wed, 2 Jul 2003 12:05:32 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307021205.33238.nemesi@ngi.it>
References: <3F028F2C.5020704@searchbroker.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <3F028F2C.5020704@searchbroker.de>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

Alle 09:52, mercoled=EC 2 luglio 2003, Lars Gemeinhardt ha scritto:
> Hello cpufreq-user and developer,
>
> can everybody with an correct PST table (diffent FIDs and VIDs) and an
> ATHLON cpu post the "dmesg" snip (you get this using the dmesg command
> after the modul is loaded) to this mailing-list...
> Maybe we can setup with this the correct values to the cpufreq driver
> (the K7 powernow part)...then otherwise the Acer and Sony notebooks
> doesn't work perfectly :-(

This is an Acer Aspire 1300DXV with and Amd Mobile Duron 1200MHz running =
Linux=20
2.5.70 vanilla

powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00e5100
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:0 (@c00e5110)
powernow:  cpuid: 0x762 fsb: 100        maxFID: 0x2     startvid: 0xb
powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0x13 (1.200V)
powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0x13 (1.200V)
powernow:    FID: 0xa (8.0x [800MHz])   VID: 0xe (1.300V)
powernow:    FID: 0xe (10.0x [1000MHz]) VID: 0xc (1.400V)
powernow:    FID: 0x2 (12.0x [1200MHz]) VID: 0xb (1.450V)

powernow: Minimum speed 500 MHz. Maximum speed 1200 MHz.

Matteo
--=20
'Detectoring is like gambling,' said Vimes, putting down the clove. 'The=20
secret is to know the winner in advance.'
(Jingo)
