From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 problem
Date: Thu, 10 Mar 2005 14:07:48 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843021DDD8D@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>, red@you.sk
Cc: cpufreq@ZenII.linux.org.uk

AMD64 systems do not have a FSB. With K7 systems, there was
a separate northbridge (memory controller/system interface),
and a bus that connected the processor(s) to the northbridge.
This was the FSB - Front Side Bus.

With K8 systems, the processors are directly linked with
HyperTransport, which is a point-to-point link, not a bus.

I do not understand what the BIOS setting labeled as FSB is
doing. Incidentally, Hypertransport link speeds are going to
be 200MHz/400Mhz/600Mhz/800MHz/1GHz only.=20

The powernow-k8 driver does not touch link speed.

PLL Lock Time is not related to link speed. It is the time
required for the processor to lock to a new frequency. It
is specified in the processor data sheets and should not
be messed with. You could increase it if you really wanted=20
to, but all you are doing is adding extra waits on a=20
frequency transition that ought not be needed. See chapter
9 in the BIOS and Kernel Developer's Guide (available on
AMD's web site) for description of the individual variables
used in frequency changes for K8.

Paul.

> -----Original Message-----
> From: Bruno Ducrot [mailto:ducrot@poupinou.org]=20
> Sent: Thursday, March 10, 2005 10:51 AM
> To: red@you.sk; Devriendt, Paul
> Cc: cpufreq@ZenII.linux.org.uk
> Subject: Re: powernow-k8 problem
>=20
> On Fri, Mar 04, 2005 at 01:00:19PM +0100, red@you.sk wrote:
> > Hello list,=20
> > i would like to ask if it`s workaround for powernow-k8 to=20
> be fuctional on AMD64 system with FSB >254Mhz. Any value=20
> bigger than 254 causing powernow-k8 module to refuse load=20
> with message "No such device". Changing only value FSB in=20
> bios to any value <=3D254 make powernow-k8 work fine again.
> > My board is abit av8 and CPU is AMD64 3000+.
> >=20
>=20
> I don't know if such workaround exist but I know for sure you should
> change the PLL_LOCK_CONVERSION in the powernow_k8.h for stability
> reason if you try to make one, because the processor use a speical
> counter clocked by the system bus in order to prevent snoop when the
> PLL lock and therefore you should give it a good one since the current
> powernow_k8 driver is written with a fsb at 200MHz in mind.
> With a FSB to (say) 254 MHz, I would put something like that:
>=20
> #define PLL_LOCK_CONVERSION 254
>=20
> I guess a proper fix should be to do so by computing the system bus
> and then pass this value instead of using PLL_LOCK_CONVERSION since
> it seems there are more and more people that want to run their
> system with a custom fsb.
>=20
> Paul, could you please give us some coments?
>=20
> Cheers,
>=20
> --=20
> Bruno Ducrot
>=20
> --  Which is worse:  ignorance or apathy?
> --  Don't know.  Don't care.
>=20
>=20
