From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Dothan VID# identification script (was Re: [ACPI]
	Speedstep-centrino problems)
Date: Sat, 19 Feb 2005 07:49:13 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60040DBAD8@scsmsx403.amr.corp.intel.com>
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
To: Rich Townsend <rhdt@bartol.udel.edu>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@ZenII.linux.org.uk, Simon Moore <Simon_Moore@condisline.com>


>-----Original Message-----
>From: cpufreq-bounces@ZenII.linux.org.uk=20
>[mailto:cpufreq-bounces@ZenII.linux.org.uk] On Behalf Of Rich Townsend
>Sent: Sunday, February 13, 2005 6:12 AM
>To: Dominik Brodowski
>Cc: cpufreq@ZenII.linux.org.uk; Simon Moore
>Subject: Re: Dothan VID# identification script (was Re: [ACPI]=20
>Speedstep-centrino problems)
>
>Dominik Brodowski wrote:
>> On Sat, Feb 12, 2005 at 06:28:27PM -0500, Rich Townsend wrote:
>>=20
>>>Of course, we can't guarantee that there will always be a=20
>match; or that=20
>>>there won't be duplicate matches. Also, this approach relies=20
>on having=20
>>>ACPI P-states, to build up the frequency/voltage table. However, it=20
>>>still seems to me to be a pretty robust way of determining=20
>the VID# in a=20
>>>system, and one that could be incorporated into speedstep-centrino.=20
>>>Dominik, what do you think?
>>=20
>>=20
>> It indeed seems somewhat robust to me, I'd like to get=20
>Venkatesh's input on
>> this, though. "Transient voltages" may pose a problem, though...
>
>Gak, hadn't thought of that.
>

Actually, if you use CNTL MSR in place of STATUS MSR, you don't have to
worry about transients.

Thanks,
Venki
