From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 problem
Date: Mon, 14 Mar 2005 11:44:53 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843021DDF84@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@ZenII.linux.org.uk

>> I do not understand what the BIOS setting labeled as FSB is
>> doing. Incidentally, Hypertransport link speeds are going to
>> be 200MHz/400Mhz/600Mhz/800MHz/1GHz only.=20
>=20
> You meant HT is not clocked by the system bus?

Ok, if you are feeding the processor an "out of spec" clock,
then, yes, the bus will also be out of spec. As will the=20
DRAM clock.

(I was actually totally confused by the original email that
referred to FSB speed, but now I see what is being done. You=20
are overclocking the part to run faster, and then using the
PowerNow capability to slow it down ?!)

>> PLL Lock Time is not related to link speed. It is the time
>> required for the processor to lock to a new frequency. It
>> is specified in the processor data sheets and should not
>> be messed with. You could increase it if you really wanted=20
>> to, but all you are doing is adding extra waits on a=20
>> frequency transition that ought not be needed. See chapter
>> 9 in the BIOS and Kernel Developer's Guide (available on
>> AMD's web site) for description of the individual variables
>> used in frequency changes for K8.
>=20
> There are BIOS that allow to change the system bus clock. And
>=20
> <quote>
> Reading #26094, 12.2.7.1 FIDVID_CTL Register, Field Description:
> Stop Grant Time-Out Count (StpGntTOCnt) -- Bits 51-32.  This
> field carries a count of system clock (5 ns) that must elapse
> from the time a new FID is applied until the time that the
> PLL is stable at the new FID.
> </quote>

Yes, if you are running at a clock that is too fast, then a count
of 5ns units will result in a time period that is too short.
However, for voltage changes, this field is ignored in rev C
and newer processors. For FID changes, it is used and is=20
significant. And, this is an input field to the driver from
the BIOS. So, if the BIOS is faking the correct clock speed,
then "correct" BIOS operation ought to be to supply an appropriate
faked value for PLL Lock Time ?!

As for having the driver calculate a correction factor based
on by how much you are overclocking the part ... this is somewhere
AMD does not want to go. Besides, I am not sure how the driver
would figure out what the actual speed was versus the reported
speed. Probably only by calibrating TSC against an external source,
but if the system is overclocked, what confidence level would I
have that the external source is true ? It would be bad to penalize
all in-spec users with excessive delays to support out-of-spec
users.

Paul.
