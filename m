From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: ondemand excessive wakeups.
Date: Mon, 12 Mar 2007 12:09:29 -0700
Message-ID: <653FFBB4508B9042B5D43DC9E18836F5170C6A@scsmsx415.amr.corp.intel.com>
References: <20070312190240.GA19796@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20070312190240.GA19796@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Monday, March 12, 2007 12:03 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: ondemand excessive wakeups.
>
>A colleague noticed that his laptop in runlevel 3 was doing=20
>~120 context
>switches a second whilst completely idle.  Process of=20
>elimation worked out
>that after disabling acpi-cpufreq & ondemand, the cs drop to=20
>around 4 per sec.
>
<deleted>
>
>Any ideas?  With tickless now being default on i386, it's somewhat
>nasty that a part of the system responsible for power saving is
>causing us to waste power ;-)
>

Yes. I had previously sent a patch to eliminate this needless ondemand
polling
when system is idle.
http://lkml.org/lkml/2006/11/21/300

But, bunch of other changes in workqueue infrastructure made this patch
invalid.
I will rework this one over latest base soon.

Thanks,=20
Venki
