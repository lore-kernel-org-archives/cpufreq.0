From: "linux-os \(Dick Johnson\)" <linux-os@analogic.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 5 Dec 2005 11:46:46 -0500
Message-ID: <Pine.LNX.4.61.0512051138400.4353@chaos.analogic.com>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com> <43946ACE.9040405@argo.co.il>
Reply-To: "linux-os \(Dick Johnson\)" <linux-os@analogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <43946ACE.9040405@argo.co.il>
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
To: Avi Kivity <avi@argo.co.il>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>, Lee Revell <rlrevell@joe-job.com>, cpufreq <cpufreq@www.linux.org.uk>, Dave Jones <davej@redhat.com>


On Mon, 5 Dec 2005, Avi Kivity wrote:

> Dave Jones wrote:
>
>> I can't think of a single valid reason why a program would want
>> to know the MHz rating of a CPU. Given that it's a) approximate,
>> b) subject to change due to power management, c) completely nonsensical
>> across CPU vendors, and d) only one of many variables regarding CPU
>> performance, any program that bases any decision on the values found
>> by parsing that field of /proc/cpuinfo is utterly broken beyond belief.
>>
>>
> Sometimes you need extremely low overhead time measurements, which need
> not be too accurate. One way to do this is to dump rdtsc measurements
> into some array, and later scale it using the cpu frequency.
>
> I've done exactly this. The processes were pinned to their processors,
> and there was no frequency scaling in effect. It worked very well.

Also humans might need to know if the botherboard is set up properly,
or can even be set up properly to be able to run the CPU at its
expected speed. FYI, I tested an expensive "blade" server that
was not configurable to anything near its advertised specifications.
The contents of /proc/cpuinfo was one of the nails I used for
the vendor's coffin.

Cheers,
Dick Johnson
Penguin : Linux version 2.6.13.4 on an i686 machine (5589.44 BogoMips).
Warning : 98.36% of all statistics are fiction.
.

****************************************************************
The information transmitted in this message is confidential and may be=
 privileged.  Any review, retransmission, dissemination, or other use of=
 this information by persons or entities other than the intended recipient=
 is prohibited.  If you are not the intended recipient, please notify=
 Analogic Corporation immediately - by replying to this message or by=
 sending an email to DeliveryErrors@analogic.com - and destroy all copies=
 of this information, including any attachments, without reading or=
 disclosing them.

Thank you.
