From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Tue, 20 Sep 2005 00:35:15 +0200
Message-ID: <432F3D23.9040308@tremplin-utc.net>
References: <42069B4D.6090505@tremplin-utc.net>
	<20050209191515.GA21319@dominikbrodowski.de>
	<422B38A1.9050706@tremplin-utc.net>
	<20050307182137.GB24559@isilmar.linta.de>
	<432DD8DD.3090805@tremplin-utc.net>
	<20050919101843.GA13041@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20050919101843.GA13041@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: venkatesh.pallipadi@intel.com
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk

19.09.2005 12:18, Dominik Brodowski wrote/a =E9crit:
> Hi,
>=20
> On Sun, Sep 18, 2005 at 11:15:09PM +0200, Eric Piel wrote:
>=20
>>Here is my third try to get speedstep-ich compatible with the ondemand=20
>>governor. Taking into account the comments of Dominik I've gone through=20
>>the intel documentation in order to get the transition latency depending =

>>on the processor.
>=20
> Thanks for doing so!
>=20
>=20
>>+	case SPEEDSTEP_PROCESSOR_PIII_T:
>>+		/* Max 100??s, according to intel's 29834006.pdf p.22 */
>=20
> 			  ^^
> The greek sign in microsecond can't be printed well, so I suggest you use
> "us" instead.
>=20
>=20
>>+		 * Max ~42??s -> 50??s, according to intel's 25068607.pdf p.40 and p.50
>=20
> 			  ^^       ^^
> same here.
Ok, sorry, just forgot it was not an ASCII character (even xterm=20
supports UTF-8 nowadays ;-) ). I'll resend as soon as I get the answer=20
from Venki.

> Other than that, it'd be great if you, Venki, could take a look at the
> technical side of this. Because of the cpufreq list still being down, I
> attached the message in full below.
Indeed, Venki, I would be extremely thanksfull if you could validate=20
those numbers. To sum up, could you confirm that the transition latency=20
between two frequencies never exeeds:
* 100us for Coppermine and Tualatin
* 50us for Pentium 4 M

Cheers
Eric



>=20
>>While for the centrino processors such information is clearly written,=20
>>this was not the case for the processors managed by speedstep-ich. I did =

>>my best to understand the electrical timing descriptions and the results =

>>look realistic, but I can't guaranty 100% certainty. At least, the code=20
>>hasn't destroyed my pentium coppermine yet ;-)
>>
>>It's against 2.6.13, hope you like it...
>>
>>Eric
>>
>>--
>>Set the transition latency of speedstep-ich depending on the processor,=20
>>using information taken from intel's manuals.
>>
>>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>>--
>=20
>=20
>>--- linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.bak	2005-08=
-08 10:14:35.000000000 +0200
>>+++ linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-09-17 =
12:50:27.000000000 +0200
>>@@ -301,6 +301,35 @@ static int speedstep_verify (struct cpuf
>> }
>>=20
>>=20
>>+/**
>>+ * speedstep_get_transition_latency - returns the maximum transition lat=
ency
>>+ * of the current processor
>>+ * @processor: type of processor
>>+ *
>>+ * The CPU transition latency depends on the type of CPU, so we get it
>>+ * from a database.
>>+ */
>>+static unsigned int speedstep_get_transition_latency(unsigned int proces=
sor)
>>+{
>>+	switch (processor) {
>>+	case SPEEDSTEP_PROCESSOR_PIII_C:
>>+	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
>>+		/* According to intel's p3_ds.pdf p.23 and table 22, similar to PIII_T=
 */
>>+	case SPEEDSTEP_PROCESSOR_PIII_T:
>>+		/* Max 100??s, according to intel's 29834006.pdf p.22 */
>>+		return 100000;
>>+	case SPEEDSTEP_PROCESSOR_P4M:
>>+		/*=20
>>+		 * Depends on the bus clock, which should be at least 100MHz.
>>+		 * Max ~42??s -> 50??s, according to intel's 25068607.pdf p.40 and p.50
>>+		 */
>>+		return 50000;
>>+	default:
>>+		/* No info has yet be found, so we are conservative */
>>+		return CPUFREQ_ETERNAL;
>>+	}
>>+}
>>+
>> static int speedstep_cpu_init(struct cpufreq_policy *policy)
>> {
>> 	int result =3D 0;
>>@@ -335,7 +364,8 @@ static int speedstep_cpu_init(struct cpu
>>=20
>> 	/* cpuinfo and default policy values */
>> 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
>>-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
>>+	policy->cpuinfo.transition_latency =3D=20
>>+		speedstep_get_transition_latency(speedstep_processor);
>> 	policy->cur =3D speed;
>>=20
>> 	result =3D cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
