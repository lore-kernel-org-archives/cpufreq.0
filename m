From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] Warn if ondemand governor can not run due to too long
	transition latency
Date: Thu, 23 Mar 2006 05:49:24 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6007A24DB5@scsmsx403.amr.corp.intel.com>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>, Dave Jones <davej@redhat.com>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>


It does return a error value today. Right? In that sense it is not
failing silently. I agree that the warning message is more effective
than the return value.=20

I am just wondering will it be better to notice this latency issue at
the driver init time itself, rather than checking at the governor switch
time. But, that is not entirely related to this patch. So, for now I
think we can go ahead with this patch. I will see if we can improve it
in anyway later.

Dave: please add this patch.

Thanks,
Venki

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Friday, March 10, 2006 1:34 AM
>To: Pallipadi, Venkatesh; Dave Jones
>Cc: CPUFreq Mailing List
>Subject: [PATCH] Warn if ondemand governor can not run due to=20
>too long transition latency
>
>Hello,
>
>The ondemand governor will not run if the transition latency of the=20
>driver is more than 10 ms. In such case, the selection of the governor=20
>will fail _silently_ (for the user). This is quite confusing and,=20
>indeed, there has already been several reports on this mailing list of=20
>user considering this as a bug.
>
>So I suggest printing a warning message if this condition is=20
>triggered.=20
>That's what does the attached patch :-)
>
>see you,
>Eric
>
>---
>From: Eric Piel <eric.piel@tremplin-utc.net>
>
>Display a warning if the ondemand governor can not be selected=20
>due to a=20
>transition latency of the cpufreq driver which is too long.
>
>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>
