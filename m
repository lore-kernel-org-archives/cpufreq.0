From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: cpufreq on-demand governor up_treshold?
Date: Fri, 13 May 2005 01:16:03 +0200
Message-ID: <4283E3B3.3070501@tremplin-utc.net>
References: <200503140829.04750.lkml@kcore.org>	<42354400.7070500@tremplin-utc.net>	<20050511013334.GB8039@redhat.com>	<20050511023448.GA25506@redhat.com>
	<4281F837.5070608@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4281F837.5070608@tremplin-utc.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, Alexander Clouter <alex-kernel@digriz.org.uk>, linux@dominikbrodowski.net

Eric Piel a =E9crit :
> Dave Jones a =E9crit :
>=20
>> On Tue, May 10, 2005 at 09:33:34PM -0400, Dave Jones wrote:
>>  >  > I'm preparing the first cpufreq->linus sync right now.
>>  > Can you write up some descriptions & signed-off-by: lines for
>>  > these three please ?
>>
>> Additionally, it'll need tweaking to diff on top of whats
>> currently in the pending queue. looks like the patch at
>> http://www.codemonkey.org.uk/projects/cpufreq/pending-patches/CPUFREQ-=
04-ondemand-cleanups.patch=20
>>
>> upsets yours a little.
>>
> Here follows the three patches, updated for the last snapshot of=20
> cpufreq. I knew there was a conflict (CPUFREQ-04 is also a patch I wrot=
e=20
> ;-) ) but was too lasy to resend them. Here you are!
>=20
Hi Dave,

I've just noticed that while I was rediffiing the patches, you had=20
integrated the 3 patches of Alexander for the ondemand governor... which=20
conflict with mine!

Concerning CPUFREQ-17-ondemand-ignore-nice.patch, it'll just require=20
rediffing again my patches, that's easy.

CPUFREQ-18-ondemand-check-rate-and-break-out.patch is in part also=20
available in "automatic-downscaling". I hadn't integrated the break if=20
the cpu frequency is max because it seemed that resetting the values for=20
down frequency is necessary all the time (maybe Venki can confirm?). So=20
I would recommand discarding it and just using "automatic-downscaling".

Finally, CPUFREQ-19-ondemand-sys_freq_step.patch brings a feature which=20
is probably not needed anymore if you use the "automatic downscaling"=20
(this can be argued though). I'd discard it too.

Please, let me know what you are planning to do. If you agree I can=20
simply send you my 3 patches against the 20050511 tree minus CPUFREQ-18=20
and CPUFREQ-19. IMHO, this would put the ondemand governor in the best=20
shape.

Eric
