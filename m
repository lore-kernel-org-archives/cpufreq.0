From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [powernow-k8] some wrong frequencies on opterons 252, howto
 find them?
Date: Mon, 28 Nov 2005 09:20:48 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A8430321898A@SAUSEXMB1.amd.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> > > Funky.  It could be that the driver is misparsin the ACPI=20
> > > objects, though I doubt that.  It could be that HP didn't
> > > put the low frequency _PSS object in the BIOS.  Can you
> > > give me the BIOS version so I can try to set up a system?=20
> >=20
> > BIOS is A05.  There is no related ACPI objects, therefore
> > the powernow configuration stuff is done by the legacy BIOS PSB/PST=20
> > tables.
> >=20
>=20
> In fact I'm wrong.  The ACPI processor objects are stored=20
> under some memory region, and are loaded via something like this:

That's a relief.  I thought something seriously weird was
happening.

>         Method (_INI, 0, NotSerialized)
>         {
>             Name (HAN0, 0x00)
>             Name (HAN1, 0x00)
>             Name (HAN2, 0x00)
>             Name (HAN3, 0x00)
>             OperationRegion (IST0, SystemMemory, SSD0, SSL0)
>             OperationRegion (IST1, SystemMemory, SSD1, SSL1)
>             OperationRegion (IST2, SystemMemory, SSD2, SSL2)
>             OperationRegion (IST3, SystemMemory, SSD3, SSL3)
>             If (LEqual (PNEN, 0x00))
>             {
>                 If (LEqual (TBL0, 0x00))
>                 {
>                     If (P0IN)
>                     {
>                         Load (IST0, HAN0)
>                         Store (0x01, TBL0)
>                     }
>                 }
> 		... (more If() statements with Load stuff inside, I
> 		guess the IST? thing is named from Intel speedstep stuff
> 		somehow,?)
>=20
>=20
>=20
> Note the Load statement.  I could eventually dump those=20
> regions and disassemble them, but I'm not sure you want
> those results.

No, that's okay.  If you could retrieve the value of
pr->performance->state_count from line 1011 of
drivers/acpi/processor.c, and the values of=20
px->control from line 1036 of the same file for each
_PSS object, that would be very helpful.

Thanks.

-Mark Langsdorf
AMD, Inc.
