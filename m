From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] transition latency of speedstep-ich (third try)
Date: Tue, 27 Sep 2005 18:26:55 -0700
Message-ID: <88056F38E9E48644A0F562A38C64FB6005D88D3D@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk



Great work! Getting those useful numbers form those documents :).

I think the 100uS and 50uS looks proper from what the documents =
describe. However, there is one factor that we are missing though. =
Speedstep-ich uses IO ports to initiate these transitions. Right? These =
IO port accesses trap into BIOS code which actually initiaites the =
trasntion. And this trap into BIOS code happens through SMM. And =
whenvever SMM's are involved I have seen latencies of upto 500uS! And in =
speedstep_ich:speedstep_set_state(), I see more than one in/out =
instructions. So, it can easily be higher than this.

I think we need to add a guestimate for SMM latency number as well.

Eric,
Can you put rdtsc's around these in/out on your system and check how =
long do they really take. On P4M, rdtsc should be running all the time =
other than the Cpu being in deep_sleep state. That should give us some =
idea about the SMM latency.

Thanks,
Venki

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Monday, September 19, 2005 3:35 PM
>To: Pallipadi, Venkatesh
>Cc: Dominik Brodowski; davej@redhat.com; cpufreq@lists.linux.org.uk
>Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
>
>19.09.2005 12:18, Dominik Brodowski wrote/a =E9crit:
>> Hi,
>>=20
>> On Sun, Sep 18, 2005 at 11:15:09PM +0200, Eric Piel wrote:
>>=20
>>>Here is my third try to get speedstep-ich compatible with=20
>the ondemand=20
>>>governor. Taking into account the comments of Dominik I've=20
>gone through=20
>>>the intel documentation in order to get the transition=20
>latency depending=20
>>>on the processor.
>>=20
>> Thanks for doing so!
>>=20
>>=20
>>>+	case SPEEDSTEP_PROCESSOR_PIII_T:
>>>+		/* Max 100??s, according to intel's 29834006.pdf p.22 */
>>=20
>> 			  ^^
>> The greek sign in microsecond can't be printed well, so I=20
>suggest you use
>> "us" instead.
>>=20
>>=20
>>>+		 * Max ~42??s -> 50??s, according to intel's=20
>25068607.pdf p.40 and p.50
>>=20
>> 			  ^^       ^^
>> same here.
>Ok, sorry, just forgot it was not an ASCII character (even xterm=20
>supports UTF-8 nowadays ;-) ). I'll resend as soon as I get the answer=20
>from Venki.
>
>> Other than that, it'd be great if you, Venki, could take a=20
>look at the
>> technical side of this. Because of the cpufreq list still=20
>being down, I
>> attached the message in full below.
>Indeed, Venki, I would be extremely thanksfull if you could validate=20
>those numbers. To sum up, could you confirm that the=20
>transition latency=20
>between two frequencies never exeeds:
>* 100us for Coppermine and Tualatin
>* 50us for Pentium 4 M
>
>Cheers
>Eric
>
>
>
>>=20
>>>While for the centrino processors such information is=20
>clearly written,=20
>>>this was not the case for the processors managed by=20
>speedstep-ich. I did=20
>>>my best to understand the electrical timing descriptions and=20
>the results=20
>>>look realistic, but I can't guaranty 100% certainty. At=20
>least, the code=20
>>>hasn't destroyed my pentium coppermine yet ;-)
>>>
>>>It's against 2.6.13, hope you like it...
>>>
>>>Eric
>>>
>>>--
>>>Set the transition latency of speedstep-ich depending on the=20
>processor,=20
>>>using information taken from intel's manuals.
>>>
>>>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>>>--
>>=20
>>=20
>>>---=20
>linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.bak=09
>2005-08-08 10:14:35.000000000 +0200
>>>+++=20
>linux-2.6.13/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c=09
>2005-09-17 12:50:27.000000000 +0200
>>>@@ -301,6 +301,35 @@ static int speedstep_verify (struct cpuf
>>> }
>>>=20
>>>=20
>>>+/**
>>>+ * speedstep_get_transition_latency - returns the maximum=20
>transition latency
>>>+ * of the current processor
>>>+ * @processor: type of processor
>>>+ *
>>>+ * The CPU transition latency depends on the type of CPU,=20
>so we get it
>>>+ * from a database.
>>>+ */
>>>+static unsigned int=20
>speedstep_get_transition_latency(unsigned int processor)
>>>+{
>>>+	switch (processor) {
>>>+	case SPEEDSTEP_PROCESSOR_PIII_C:
>>>+	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
>>>+		/* According to intel's p3_ds.pdf p.23 and=20
>table 22, similar to PIII_T */
>>>+	case SPEEDSTEP_PROCESSOR_PIII_T:
>>>+		/* Max 100??s, according to intel's 29834006.pdf p.22 */
>>>+		return 100000;
>>>+	case SPEEDSTEP_PROCESSOR_P4M:
>>>+		/*=20
>>>+		 * Depends on the bus clock, which should be at=20
>least 100MHz.
>>>+		 * Max ~42??s -> 50??s, according to intel's=20
>25068607.pdf p.40 and p.50
>>>+		 */
>>>+		return 50000;
>>>+	default:
>>>+		/* No info has yet be found, so we are conservative */
>>>+		return CPUFREQ_ETERNAL;
>>>+	}
>>>+}
>>>+
>>> static int speedstep_cpu_init(struct cpufreq_policy *policy)
>>> {
>>> 	int result =3D 0;
>>>@@ -335,7 +364,8 @@ static int speedstep_cpu_init(struct cpu
>>>=20
>>> 	/* cpuinfo and default policy values */
>>> 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
>>>-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
>>>+	policy->cpuinfo.transition_latency =3D=20
>>>+		speedstep_get_transition_latency(speedstep_processor);
>>> 	policy->cur =3D speed;
>>>=20
>>> 	result =3D cpufreq_frequency_table_cpuinfo(policy,=20
>speedstep_freqs);
>
>
