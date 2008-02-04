From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: (ondemand) CPU governor  regression between 2.6.23 and 2.6.24
Date: Mon, 4 Feb 2008 09:44:24 -0800
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE7830C7@orsmsx423.amr.corp.intel.com>
References: <200801261506.28544.toralf.foerster@gmx.de>
	<20080203163255.467256d4.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20080203163255.467256d4.akpm@linux-foundation.org>
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
To: Andrew Morton <akpm@linux-foundation.org>, =?iso-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

 =


>-----Original Message-----
>From: linux-kernel-owner@vger.kernel.org =

>[mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of Andrew Morton
>Sent: Sunday, February 03, 2008 4:33 PM
>To: Toralf F=F6rster
>Cc: linux-kernel@vger.kernel.org; cpufreq@www.linux.org.uk
>Subject: Re: (ondemand) CPU governor regression between 2.6.23 =

>and 2.6.24
>
>On Sat, 26 Jan 2008 15:06:25 +0100 Toralf F=F6rster =

><toralf.foerster@gmx.de> wrote:
>
>> I use a 1-liner for a simple performance check : "time =

>factor 819734028463158891"
>> Here is the result for the new (Gentoo) kernel 2.6.24:
>> =

>> With the  ondemand governor of the  I get:
>> =

>> tfoerste@n22 ~/tmp $ time factor 819734028463158891
>> 819734028463158891: 3 273244676154386297
>> =

>> real    0m32.997s
>> user    0m15.732s
>> sys     0m0.014s
>> =

>> With the ondemand governor the CPU runs at 600 MHz,
>> whereas with the performance governor I get :
>> =

>> tfoerste@n22 ~/tmp $ time factor 819734028463158891
>> 819734028463158891: 3 273244676154386297
>> =

>> real    0m10.893s
>> user    0m5.444s
>> sys     0m0.000s
>> =

>> (~5.5 sec as I expected) b/c the CPU is set to 1.7 GHz.
>> =

>> The ondeman governor of previous kernel versions however =

>automatically increased
>> the CPU speed from 600 MHz to 1.7 GHz.
>> =

>> My system is a ThinkPad T41, I'll attach the .config =

>> =

>

This looks like is related to the report here
http://www.ussg.iu.edu/hypermail/linux/kernel/0801.3/1260.html

Can you try the workarounds on that thread and see whether the problem goes=
 away.

Thanks,
Venki
