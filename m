From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: new p4-clockmod capable CPUs
Date: Sat, 7 Oct 2006 06:46:12 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454B2E6AC@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Friday, October 06, 2006 5:27 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: new p4-clockmod capable CPUs
>
>Hi,
>
>On Tue, Oct 03, 2006 at 11:44:58AM -0700, Pallipadi, Venkatesh wrote:
>> >Hi,
>> >
>> >On Mon, Oct 02, 2006 at 04:23:17PM -0700, Pallipadi,=20
>Venkatesh wrote:
>> >> >- Is the method in pentiumM_get_frequency() for these CPUs?
>> >> May not work and will need change. The bus speed will not be=20
>> >100 on all
>> >> these CPUs..
>> >
>> >What's the register to look at, and the values? Can't find=20
>anything in
>> >245472-012, unfortunately, which would help me for this...
>> >
>>=20
>> MSR_FSB_FREQ - Latest SDM vol 3b (253669-020) has the=20
>information under
>> Core/Core2 MSRs (Ap B2).
>
>Ah. Thanks. Now only the new Celerons and Xeons confuse me -- they're
>family 6, model 14, stepping 8. Is Ap B1 still valid, as they're called
>Xeons (and Celerons)?
>
>I am confused by all these marketing names being re-used and=20
>re-used and
>re-used and re-used.... sorry ;)
>

Hmm... That above doc gives MSR details but doesn't seem to say how to
identify a Core/Core 2 processor. I had to look for another ref here.
http://download.intel.com/design/mobile/SPECUPDT/30922205.pdf
Which says as long as family is 0xf and model 0xe, you can assume it to
be Core microarch. And model 0xf will be core 2 in a similar way.
Irrespective of final marketing name that they may acquire.

Thanks,
Venki
