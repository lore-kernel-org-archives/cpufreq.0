From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
Date: Mon, 21 Feb 2005 10:05:47 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60040DBCC8@scsmsx403.amr.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dominik Brodowski <linux@dominikbrodowski.net>, Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>


>-----Original Message-----
>From: cpufreq-bounces@ZenII.linux.org.uk=20
>[mailto:cpufreq-bounces@ZenII.linux.org.uk] On Behalf Of=20
>Dominik Brodowski
>Sent: Monday, February 21, 2005 7:54 AM
>To: Eric Piel
>Cc: davej@redhat.com; cpufreq@ZenII.linux.org.uk;=20
>alex-kernel@digriz.org.uk; Alexander Clouter
>Subject: Re: [PATCH] (1/3) cpufreq_ondemand - 01_ignore-nice.diff
>
>On Mon, Feb 21, 2005 at 11:20:51AM +0100, Eric Piel wrote:
>> Eric Piel a =E9crit :
>> >Alexander Clouter a =E9crit :
>> >
>> >>Adds support to cpufreq_ondemand to ignore 'nice' cpu time
>> >>
>> >IMO, this policy should be has lightweight as possible. Why=20
>not making=20
>> >this feature just hard-coded? Don't count the load that=20
>nice'd tasks do,=20
>> >period!
>> >
>> >It would make the patch 5 lines instead of 50. Every=20
>userspace deamon=20
>> >have this feature enabled by default, so this is a very reasonable=20
>> >trade-off.
>> >
>> Here is the patch, it does exactly the same functionality but it's=20
>> completly static and therefore much smaller. Just tested on=20
>my computer,=20
>> it does the trick.
>
>IMO it was a wise decision to do this as a tuneable parameter.
>

I too feel having a tunable parameter here is OK. This may make the =
patch big=20
and the code size big as well. But, I don't think it is adding too much=20
overhead at run-time. As long as no one changes these nice setting =
frequently,
the governor will still be lightweight. Right?

Thanks,
Venki
