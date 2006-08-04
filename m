From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Fri, 4 Aug 2006 13:16:03 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84545A5DD7@scsmsx413.amr.corp.intel.com>
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
To: Erik Slagter <erik@slagter.name>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Erik Slagter
>Sent: Friday, August 04, 2006 1:46 AM
>To: cpufreq@lists.linux.org.uk
>Subject: RE: problems setting freq on dual core t2600,=20
>2.6.17-1.2157_FC5smp
>
>On do, 2006-08-03 at 13:47 -0700, Pallipadi, Venkatesh wrote:
>
>> /proc/cpuinfo and scaling_cur_freq shows previously cached=20
>value, value
>> that was tried to be set last time. cpuinfo_cur_freq shows current
>> frequency that is gets from hardware.
>
>Huh, I don't have this entry! Only min and max.
>
>

This entry depends on what scaling_driver you are using. If you are
using speedstep_centrino, you should have this..

Thanks,
Venki
